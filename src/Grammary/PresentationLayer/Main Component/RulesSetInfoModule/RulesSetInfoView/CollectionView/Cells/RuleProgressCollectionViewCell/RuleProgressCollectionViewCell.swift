//
//  RuleProgressCollectionViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/23/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class RuleProgressCollectionViewCell: UICollectionViewCell, CollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var ruleLabel: UILabel!
    @IBOutlet weak var progressCountLabel: UILabel!
    @IBOutlet weak var errorCountLabel: UILabel!
    @IBOutlet weak var gradientView: GradientView!
    
    // MARK: - Private properties
    
    private var item: RuleProgressItem!
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientView.cornerRadius = 8
        ruleLabel.font = .textStyle3
        errorCountLabel.font = .textStyle14
        progressCountLabel.font = .textStyle14
    }
    
    // MARK: - CollectionViewCell
    
    func configure(item: CollectionViewItem) {
        guard let item = item as? RuleProgressItem else {
            assertionFailure()
            return
        }
        
        ruleLabel.text = item.name
        progressCountLabel.text = "\(item.correctAnswers)"
        errorCountLabel.text = "\(item.errorCount)"
        
        let gradientTypeIndex = item.index % GradientType.items.count
        gradientView.gradientType = GradientType.items[gradientTypeIndex]
        
        self.item = item
    }
}
