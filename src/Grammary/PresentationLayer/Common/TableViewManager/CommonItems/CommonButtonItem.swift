//
//  CommonButtonItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct CommonButtonItem: TableViewItem {
    let name: String
    var tapHandler: CommonBlock?
    
    // MARK: - TableViewItem
    
    static let cellClass: TableViewCellConformable.Type = CommonButtonTableViewCell.self
}
