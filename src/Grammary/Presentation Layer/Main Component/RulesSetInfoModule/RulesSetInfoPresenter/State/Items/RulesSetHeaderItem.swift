//
//  RulesSetHeaderItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct RulesSetHeaderItem: TableViewItem {
    let name: String
    var totalProgress: Double
    var onStudyTap: (CommonBlock)?
    
    // MARK: - TableViewItem
    
    static let cellClass: TableViewCellConformable.Type = RulesSetHeaderTableViewCell.self
}
