//
//  DashboardViewController.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit
import SnapKit

final class DashboardViewController: UIViewController, DashboardView {

    private enum Constants {
        static let cornerRadius: CGFloat = 64
        static let headerheight: CGFloat = 125
        static let footerHeight: CGFloat = 74
        static let statisticViewLeft: CGFloat = 30
        static let statisticViewBottom: CGFloat = 31
        static let statisticViewTop: CGFloat = 60
    }
    
    // MARK: - Outlets

    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBOutlet weak var topContainerView: RoundedView!
    @IBOutlet weak var topGradientView: GradientView!
    @IBOutlet weak var topContainerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var middleContainerView: RoundedView!
    @IBOutlet weak var middleGradientView: GradientView!
    @IBOutlet weak var middleContainerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var bottomContainerView: RoundedView!
    @IBOutlet weak var bottomGradientView: GradientView!
    @IBOutlet weak var bottomContainerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var nextExersiceDateLabel: UILabel!
    @IBOutlet weak var nextExersiceLabel: UILabel!
    @IBOutlet weak var studyButton: UIButton!

    // MARK: - Private properties
    
    private var topStatisticView: StatisticView!
    private var middleStatisticView: StatisticView!
    private var bottomStatisticView: StatisticView!
    private var topBackgroundView: UIView!
    
    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
        configureContainerViews()
        configureStatisticViews()
        configureLabels()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.didTriggerViewWillAppearEvent()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        let bottomSafeAreaPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        let tabBarHeight = tabBarController?.tabBar.frame.height ?? 0 + bottomSafeAreaPadding
        let screenHeight = UIScreen.main.bounds.height
        let pageHeight = (screenHeight - Constants.footerHeight - Constants.headerheight - tabBarHeight)/3
        
        topContainerViewHeight.constant = pageHeight + Constants.headerheight
        middleContainerViewHeight.constant = pageHeight + Constants.cornerRadius
        bottomContainerViewHeight.constant = pageHeight + Constants.cornerRadius
    }
    
    // MARK: - Actions

    @IBAction func studyButtonTap(_ sender: UIButton) {
        presenter?.didTapStudyButton()
    }
    
    // MARK: - DashboardView

    var presenter: DashboardPresenter?
    
    func configure(state: DashboardState) {
        topGradientView.gradientType = state.isDay ? .item1 : .blueBG
        configureTopBackgroudImageView(isDay: state.isDay)

        let topStatisticTitle = "Общий прогресс за \(state.totalCountOfDays) \(state.totalCountOfDays.getDayEnding())"
        topStatisticView.configure(count: Int(state.totalProgress * 100),
                                   countTitle: "/ 100%",
                                   title: topStatisticTitle)
        
        configureGreetingLabel(isDay: state.isDay, userName: state.userName)
        
        middleStatisticView.configure(count: state.totalCountOfCompletedRules,
                                      countTitle: state.totalCountOfCompletedRules.getRuleEnding(),
                                      title: "Изучено в рамках тренировок")
        
        let totalExerciseTimeTitle: String
        let totalExerciseTime: Int
        let minutes = state.totalExerciseTime / 60
        if minutes > 100 {
            totalExerciseTime = Int(minutes / 60)
            totalExerciseTimeTitle = totalExerciseTime.getHourEnding()
        } else {
            totalExerciseTime = Int(minutes)
            totalExerciseTimeTitle = totalExerciseTime.getMinutesEnding()
        }
        bottomStatisticView.configure(count: totalExerciseTime,
                                      countTitle: totalExerciseTimeTitle,
                                      title: "Потрачено на тренировки")
        
        switch state.reviseRecommendation {
        case .relax:
            studyButton.isHidden = true
        default:
            studyButton.isHidden = false
        }
        nextExersiceLabel.text = state.reviseRecommendation.labelString
        nextExersiceDateLabel.text = state.reviseRecommendation.dateString
        
        topGradientView.sendSubviewToBack(topBackgroundView)
    }
}

private extension DashboardViewController {
    
    func configureContainerViews() {
        topContainerView.cornersToRound = .bottomLeft
        topContainerView.cornerRadius = Constants.cornerRadius
        
        middleContainerView.cornersToRound = .bottomLeft
        middleContainerView.cornerRadius = Constants.cornerRadius
        middleGradientView.gradientType = .item2
        
        bottomContainerView.cornersToRound = .bottomLeft
        bottomContainerView.cornerRadius = Constants.cornerRadius
        bottomGradientView.gradientType = .item3
    }
    
    func configureTopBackgroudImageView(isDay: Bool) {
        let nibName = isDay ? "DayDashboardView" : "NightDashboardView"
        guard let bgView = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? UIView else {
            return
        }
        topBackgroundView?.removeFromSuperview()
        topGradientView.addSubview(bgView)
        bgView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        topBackgroundView = bgView
    }

    func configureGreetingLabel(isDay: Bool, userName: String?) {
        let nameStr: String
        if let userName = userName, !userName.isEmpty {
            nameStr = ", " + userName
        } else {
            nameStr = ""
        }
        greetingLabel.text = isDay
            ? "Добрый день" + nameStr
            : "Добрый вечер" + nameStr
        topGradientView.bringSubviewToFront(greetingLabel)
    }
    
    func configureStatisticViews() {
        topStatisticView = StatisticView.fromNib()
        topGradientView.addSubview(topStatisticView)
        topStatisticView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Constants.statisticViewLeft)
            $0.bottom.equalToSuperview().offset(-Constants.statisticViewBottom)
        }
        
        middleStatisticView = StatisticView.fromNib()
        middleGradientView.addSubview(middleStatisticView)
        middleStatisticView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Constants.statisticViewLeft)
            $0.bottom.equalToSuperview().offset(-Constants.statisticViewBottom).priority(500)
            $0.top.greaterThanOrEqualToSuperview().offset(Constants.statisticViewTop)
        }
        
        bottomStatisticView = StatisticView.fromNib()
        bottomGradientView.addSubview(bottomStatisticView)
        bottomStatisticView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Constants.statisticViewLeft)
            $0.bottom.equalToSuperview().offset(-Constants.statisticViewBottom).priority(500)
            $0.top.greaterThanOrEqualToSuperview().offset(Constants.statisticViewTop)
        }
    }
    
    func configureLabels() {
        greetingLabel.font = UIFont.textStyle18
        nextExersiceLabel.font = UIFont.textStyle14
        nextExersiceDateLabel.font = UIFont.textStyle13
    }
}
