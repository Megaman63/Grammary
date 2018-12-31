//
//  UITableView+Extension.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 31/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

extension UITableView {
    func registerWithNib<CellClass: UITableViewCell>(cellClass: CellClass.Type) {
        let nib = UINib(nibName: String(describing: CellClass.self), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: CellClass.self))
    }
    
    func dequeue<CellClass: UITableViewCell>(_: CellClass.Type) -> CellClass {
        let cellClassName = String(describing: CellClass.self)
        let cell = dequeueReusableCell(withIdentifier: cellClassName)
        guard let typedCell = cell as? CellClass else {
            fatalError("Could not deque cell with type \(CellClass.self)")
        }
        return typedCell
    }
    
    func dequeueAndConfigureTableViewCell(forItem item: TableViewItem, indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: item.reusableIdentifier, for: indexPath)
        if let cell = cell as? TableViewCell {
            cell.configure(item: item)
        } else {
            assertionFailure()
        }
        return cell
    }
}
