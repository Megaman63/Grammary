//
//  RuleProgressTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class RuleProgressTableViewCell: UITableViewCell, TableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var ruleLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    // MARK: - Private properties
    
    private var item: RuleProgressItem!
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? RuleProgressItem else {
            assertionFailure()
            return
        }
        
        ruleLabel.text = item.name
        progressLabel.text = "Correct answers: \(item.correctAnswers), mistakes: \(item.errorCount)"
        self.item = item
    }
    
}
