//
//  SettingsSliderItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

struct SettingsSliderItem: TableViewItem {
    let title: String
    let currentValue: Int
    let minValue: Int
    let maxValue: Int
    
    let valueChanged: ((Int) -> Void)?
    
    // MARK: - TableViewItem
    
    static var cellClass: TableViewCellConformable.Type = SliderTableViewCell.self
}
