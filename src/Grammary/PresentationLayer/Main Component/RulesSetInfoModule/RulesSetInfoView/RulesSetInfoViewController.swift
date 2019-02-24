//
//  RulesSetInfoViewController.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetInfoViewController: UIViewController, RulesSetInfoView {

    private enum Constants {
        static let itemsSideMargin: CGFloat = 16
        static let itemsBottomMargin: CGFloat = 80
        static let itemsMinSpace: CGFloat = 17
        static let titleMargin: CGFloat = 32
    }
    
    // MARK: - Private properties
    
    private var collectionViewManager: CollectionViewManager!
    
    // MARK: - Outlets
    
    @IBOutlet private weak var studyButtonBackgroundView: GradientView!
    @IBOutlet private weak var studyButton: UIButton!
    @IBOutlet private weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet private weak var headerView: RuleSetHeaderView!
    @IBOutlet private weak var ruleTitleLabel: RuleTitleLabel!
    
    @IBOutlet private weak var headerViewTopConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkTwo

        configreRuleTitleLabel()
        headerView.configureHeader()
        headerView.delegate = self
        configureCollectionView()
        configureStudyButton()

        presenter?.didTriggerViewReadyEvent()
    }

    // MARK: - Actions

    @IBAction func studyButtonTap(_ sender: UIButton) {
        presenter?.didTapStudyButton()
    }
    
    // MARK: - RulesSetInfoView

    var presenter: RulesSetInfoPresenter?
    
    func set(dataSource: [CollectionViewSection]) {
        collectionViewManager.dataSource = dataSource
    }
    
    func configure(headerItem: RulesSetHeaderItem) {
        ruleTitleLabel.text = headerItem.title
        headerView.configure(headerItem: headerItem)
    }
    
    // MARK: - Private functions
    
    private func configreRuleTitleLabel() {
        ruleTitleLabel.font = .textStyle2
        ruleTitleLabel.textColor = .white
        ruleTitleLabel.delegate = self
    }
    
    private func configureStudyButton() {
        studyButton.setTitle("Учить", for: .normal)
        studyButton.titleLabel?.font = .textStyle15
        studyButton.setTitleColor(.darkTwo, for: .normal)
        
        studyButtonBackgroundView.gradientType = .button
        studyButtonBackgroundView.cornerRadius = 24
    }
    
    private func configureCollectionView() {
        collectionViewManager = CollectionViewManager(collectionView: collectionView)
        collectionView.registerWithNib(cellClass: RuleProgressCollectionViewCell.self)
        collectionView.contentInsetAdjustmentBehavior = .never
        (collectionView as UIScrollView).delegate = self
        
        var itemWidth = Int((UIScreen.main.bounds.width - 2 * Constants.itemsSideMargin - Constants.itemsMinSpace)/2)
        itemWidth = itemWidth % 2 == 0 ? itemWidth : itemWidth - 1
        //flowLayout.kResistence = 1800
        flowLayout.itemSize = CGSize(width: CGFloat(itemWidth), height: CGFloat(itemWidth))
    }
    
    private func configureCollectionViewSectionInset(withTopInset top: CGFloat) {
        flowLayout.sectionInset = UIEdgeInsets(top: top,
                                               left: Constants.itemsSideMargin,
                                               bottom: Constants.itemsBottomMargin,
                                               right: Constants.itemsSideMargin)
    }
}

extension RulesSetInfoViewController: RuleSetHeaderViewDelegate {
    
    // MARK: - RuleSetHeaderViewDelegate
    
    func ruleSetHeaderViewDidChange(headerView: RuleSetHeaderView, height: CGFloat) {
        configureCollectionViewSectionInset(withTopInset: height + Constants.itemsMinSpace)
    }
}

extension RulesSetInfoViewController: RuleTitleLabelDelegate {
    
    // MARK: - RuleTitleLabelDelegate
    
    func ruleTitleLabelDidChange(label: RuleTitleLabel, frame: CGRect) {
        headerView.configure(separatorTopConstraintConstant: frame.maxY + Constants.itemsSideMargin)
    }
}

extension RulesSetInfoViewController: UIScrollViewDelegate {
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            headerViewTopConstraint.constant = 0
        } else if offsetY <= headerView.frame.height - ruleTitleLabel.frame.maxY - Constants.titleMargin {
            headerViewTopConstraint.constant = -offsetY
        } else {
            let constant = -headerView.frame.height + ruleTitleLabel.frame.maxY + Constants.titleMargin
            headerViewTopConstraint.constant = constant
        }
        
        headerView.calculateAlphaForSubviews(collectionViewOffsetY: offsetY, maxOffset: ruleTitleLabel.frame.maxY)
        view.layoutIfNeeded()
    }

}

protocol RuleTitleLabelDelegate: AnyObject {
    func ruleTitleLabelDidChange(label: RuleTitleLabel, frame: CGRect)
}

class RuleTitleLabel: UILabel {
    
    weak var delegate: RuleTitleLabelDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        delegate?.ruleTitleLabelDidChange(label: self, frame: frame)
    }
}

protocol RuleSetHeaderViewDelegate: AnyObject {
    func ruleSetHeaderViewDidChange(headerView: RuleSetHeaderView, height: CGFloat)
}

class RuleSetHeaderView: UIView {
    
    private enum Constants {
        static let alphaPositionTreshold: CGFloat = 30
    }
    
    override var frame: CGRect {
        didSet {
            print("RuleSetHeaderView \(frame)")
        }
    }
    
    // MARK: - Public functions
    
    weak var delegate: RuleSetHeaderViewDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet private weak var headerGradientView: GradientView!
    
    @IBOutlet private weak var ruleDescriptionLabel: UILabel!
    
    @IBOutlet private weak var separator: UIView!
    @IBOutlet private weak var separatorTopConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var progressLabel: UILabel!
    @IBOutlet private weak var progressView: ProgressView!
    @IBOutlet private weak var leftoverProgressLabel: UILabel!
    
    @IBOutlet private weak var nextExerciseDateLabel: UILabel!
    @IBOutlet private weak var nextExersiceLabel: UILabel!
   
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: .bottomLeft, radius: 64)
        delegate?.ruleSetHeaderViewDidChange(headerView: self, height: self.frame.height)
    }
    
    // MARK: - Public functions
    
    func configureHeader() {
        headerGradientView.gradientType = .darkBG
        
        separator.backgroundColor = UIColor.purpley.withAlphaComponent(0.15)
        separator.layer.cornerRadius = 2
        
        ruleDescriptionLabel.font = .textStyle8
        ruleDescriptionLabel.textColor = .white
        
        progressLabel.font = .textStyle23
        progressLabel.textColor = .white
        
        progressView.progressGradientViewHeight = 18
        progressView.stripViewHeight = 12
        
        leftoverProgressLabel.font = .textStyle23
        leftoverProgressLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        
        nextExersiceLabel.font = .textStyle14
        nextExersiceLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        
        nextExerciseDateLabel.font = .textStyle13
        nextExerciseDateLabel.textColor = .white
    }
    
    func configure(headerItem: RulesSetHeaderItem) {
        ruleDescriptionLabel.text = headerItem.description
        
        let progress = Int((headerItem.totalProgress * 100).rounded())
        progressLabel.text = "\(progress)%"
        
        let leftoverProgress = Int(((1 - headerItem.totalProgress) * 100).rounded())
        leftoverProgressLabel.text = "\(leftoverProgress)%"
        
        progressView.set(progress: CGFloat(headerItem.totalProgress), animated: true)
        
        nextExersiceLabel.text = headerItem.reviseRecommendation.labelString
        nextExerciseDateLabel.text = headerItem.reviseRecommendation.dateString.uppercased()
    }
    
    func calculateAlphaForSubviews(collectionViewOffsetY: CGFloat, maxOffset: CGFloat) {
        for view in headerGradientView.subviews {
            guard view !== separator, let globalY = view.globalPoint?.y else {
                continue
            }
            
            let progress: CGFloat
            if globalY < maxOffset {
                progress = 1
            } else if globalY >= maxOffset, globalY < maxOffset + Constants.alphaPositionTreshold {
                progress = 1 - (globalY - maxOffset) / Constants.alphaPositionTreshold
            } else {
                progress = 0
            }
            view.alpha = 1 - progress
        }
        
        if let globalY = separator.globalPoint?.y {
            let progress: CGFloat
            if globalY < maxOffset {
                progress = 1
            } else if globalY >= maxOffset, globalY < separator.frame.origin.y {
                progress = 1 - (globalY - maxOffset) / (separator.frame.origin.y - globalY)
            } else {
                progress = 0
            }
            separator.alpha = 1 - progress
        }
    }
    
    func configure(separatorTopConstraintConstant: CGFloat) {
        separatorTopConstraint.constant = separatorTopConstraintConstant
    }
}
