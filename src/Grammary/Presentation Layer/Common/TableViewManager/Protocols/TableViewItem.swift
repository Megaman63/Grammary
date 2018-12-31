//
//  TableViewItem.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 31/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol TableViewItem {
    static var cellClass: UITableViewCell.Type { get }
}

extension TableViewItem {
    var reusableIdentifier: String {
        return String(describing: Self.cellClass)
    }
}
