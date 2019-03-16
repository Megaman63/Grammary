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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
}

private extension RulesSetInfoViewController {

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
