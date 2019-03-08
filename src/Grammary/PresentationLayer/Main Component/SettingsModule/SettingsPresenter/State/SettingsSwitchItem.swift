//
//  SettingsSwitchItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/8/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

struct SettingsSwitchItem: TableViewItem {
    let title: String
    let subTitle: String
    let isOn: Bool
    
    let valueChanged: ((Bool) -> Void)?
    
    // MARK: - TableViewItem
    
    static var cellClass: TableViewCellConformable.Type = NotificationTableViewCell.self
}
