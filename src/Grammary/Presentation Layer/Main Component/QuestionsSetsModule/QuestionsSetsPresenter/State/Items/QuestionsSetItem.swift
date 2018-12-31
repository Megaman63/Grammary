//
//  QuestionsSetItem.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 31/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct QuestionsSetItem: TableViewItem {
    let id: String
    let name: String
    var totalProgress: Double
    
    // MARK: - TableViewItem
    
    static let cellClass: UITableViewCell.Type = QuestionsSetTableViewCell.self
}
