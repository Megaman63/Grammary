//
//  QuestionsSetTableViewCell.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 31/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

class QuestionsSetTableViewCell: UITableViewCell {

    // MARK: - Private properties
    
    var item: QuestionsSetItem!
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension QuestionsSetTableViewCell: TableViewCell {
    
    // MARK: - QuestionsSetTableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? QuestionsSetItem else {
            assertionFailure()
            return
        }
        self.item = item
    }
}
