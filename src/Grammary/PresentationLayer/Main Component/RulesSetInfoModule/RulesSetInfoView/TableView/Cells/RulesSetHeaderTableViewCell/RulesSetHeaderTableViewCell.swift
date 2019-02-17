//
//  RulesSetHeaderTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class RulesSetHeaderTableViewCell: UITableViewCell, TableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var studyButton: UIButton!
    
    // MARK: - Private properties
    
    private var item: RulesSetHeaderItem!
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Actions
    
    @IBAction func studyButtonTap(_ sender: UIButton) {
        item.onStudyTap?()
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? RulesSetHeaderItem else {
            assertionFailure()
            return
        }
        
        self.item = item
        titleLabel.text = item.name
        let percents = (item.totalProgress * 100).rounded(.toNearestOrEven)
        
        var progressText = "Выучено на \(Int(percents)) %"
        if let dateString = item.nextReviseRecommendedDateString {
            progressText = progressText + "\nСледующая тренировка: " + dateString
        }
        progressLabel.text = progressText
    }
}
