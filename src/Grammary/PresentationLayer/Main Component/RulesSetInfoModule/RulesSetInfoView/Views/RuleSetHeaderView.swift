//
//  RuleSetHeaderView.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/24/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol RuleSetHeaderViewDelegate: AnyObject {
    func ruleSetHeaderViewDidChange(headerView: RuleSetHeaderView, height: CGFloat)
}

class RuleSetHeaderView: UIView {
    
    private enum Constants {
        static let alphaPositionTreshold: CGFloat = 30
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
    
    @IBOutlet private weak var nextExersiceDateLabel: UILabel!
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
        
        nextExersiceDateLabel.font = .textStyle13
        nextExersiceDateLabel.textColor = .white
    }
    
    func configure(headerItem: RulesSetHeaderItem) {
        ruleDescriptionLabel.text = headerItem.description
        
        let progress = Int((headerItem.totalProgress * 100).rounded())
        progressLabel.text = "\(progress)%"
        
        let leftoverProgress = Int(((1 - headerItem.totalProgress) * 100).rounded())
        leftoverProgressLabel.text = "\(leftoverProgress)%"
        
        progressView.set(progress: CGFloat(headerItem.totalProgress), animated: true)
        
        nextExersiceLabel.text = headerItem.reviseRecommendation.labelString
        nextExersiceDateLabel.text = headerItem.reviseRecommendation.dateString.uppercased()
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
