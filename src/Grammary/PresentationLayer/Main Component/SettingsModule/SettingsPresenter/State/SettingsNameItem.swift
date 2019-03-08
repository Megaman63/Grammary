//
//  SettingsNameItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/8/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

struct SettingsNameItem: TableViewItem {
    let name: String
    let valueChanged: ((String) -> Void)?
    
    // MARK: - TableViewItem
    
    static var cellClass: TableViewCellConformable.Type = NameTableViewCell.self
}
