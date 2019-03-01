//
//  RulesSetCollectionViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/1/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class RulesSetCollectionViewCell: UICollectionViewCell, CollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var ruleTitleLabel: UILabel!
    @IBOutlet weak var ruleSubtitleLabel: UILabel!
    @IBOutlet weak var progressLabel: PaddingLabel!
    @IBOutlet weak var gradientView: GradientView!
    
    // MARK: - Private properties
    
    private var item: RulesSetItem!
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientView.cornerRadius = 8
        
        ruleTitleLabel.font = .textStyle3
        
        ruleSubtitleLabel.font = .textStyle7
        ruleSubtitleLabel.textColor = UIColor.white.withAlphaComponent(0.65)
        
        progressLabel.font = .textStyle10
        progressLabel.textColor = .darkTwo
        progressLabel.layer.cornerRadius = progressLabel.frame.height/2
        progressLabel.padding = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
    }
    
    // MARK: - CollectionViewCell
    
    func configure(item: CollectionViewItem) {
        guard let item = item as? RulesSetItem else {
            assertionFailure()
            return
        }

        if item.searchText.isEmpty {
            ruleTitleLabel.text = item.name
        } else {
            emphasize(text: item.name,
                      searchText: item.searchText,
                      inLabel: ruleTitleLabel,
                      boldFont: UIFont.textStyle3)
        }
        
        ruleSubtitleLabel.text = item.sibtitle
        
        progressLabel.isHidden = item.totalProgress == 0
        progressLabel.text = "\(Int(item.totalProgress * 100)) %"
        
        let gradientTypeIndex = item.index % GradientType.items.count
        gradientView.gradientType = GradientType.items[gradientTypeIndex]
        
        self.item = item
    }
    
    // MARK: - Private functions
    
    private func emphasize(text: String, searchText: String, inLabel label: UILabel, boldFont: UIFont) {
        guard
            !text.isEmpty,
            !searchText.isEmpty,
            let baseFont = label.font
            else {
                return
        }
        
        let rezultAttributedString = NSMutableAttributedString(string: "")
        let boldFontAttribute: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.textStyle3,
            NSAttributedString.Key.foregroundColor: UIColor.basicBlue
        ]
        
        for textComponent in text.components(separatedBy: .whitespaces) {
            let attributedString =
                NSMutableAttributedString(string: textComponent + " ",
                                          attributes: [NSAttributedString.Key.font: baseFont])
            
            for searchCompoment in searchText.components(separatedBy: .whitespaces) {
                let range = (textComponent.lowercased() as NSString).range(of: searchCompoment.lowercased())
                if range.contains(0) {
                    attributedString.addAttributes(boldFontAttribute, range: range)
                }
            }
            rezultAttributedString.append(attributedString)
        }
        
        label.attributedText = rezultAttributedString
    }
}
