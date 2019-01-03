//
//  ExampleItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct ExampleItem: TableViewItem {
    
    let text: String
    
    // MARK: - TableViewItem
    
    static var cellClass: UITableViewCell.Type = ExampleTableViewCell.self
}
