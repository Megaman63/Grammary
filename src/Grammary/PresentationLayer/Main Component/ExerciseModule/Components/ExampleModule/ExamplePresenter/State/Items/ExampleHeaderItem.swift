//
//  ExampleHeaderItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/10/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

struct ExampleHeaderItem: TableViewItem {
    
    let caption: String
    
    // MARK: - TableViewItem
    
    static var cellClass: TableViewCellConformable.Type = ExampleHeaderTableViewCell.self
}
