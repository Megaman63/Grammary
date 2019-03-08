//
//  SecondaryTitleItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

struct SecondaryTitleItem: TableViewItem {
    let title: String
    
    // MARK: - TableViewItem
    
    static let cellClass: TableViewCellConformable.Type = SecondaryTitleTableViewCell.self
}
