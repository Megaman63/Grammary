//
//  RuleProgressItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct RuleProgressItem: TableViewItem {
    let name: String
    var errorCount: Int
    var correctAnswers: Int
    
    // MARK: - TableViewItem
    
    static let cellClass: TableViewCellConformable.Type = RuleProgressTableViewCell.self
}
