//
//  UICollectionView+Extension.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/23/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerWithNib<CellClass: UICollectionViewCell>(cellClass: CellClass.Type) {
        let cellClassName = String(describing: CellClass.self)
        let nib = UINib(nibName: cellClassName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: cellClassName)
    }
    
    func dequeue<CellClass: UICollectionViewCell>(_: CellClass.Type, for intexPath: IndexPath) -> CellClass {
        let cellClassName = String(describing: CellClass.self)
        let cell = dequeueReusableCell(withReuseIdentifier: cellClassName, for: intexPath)
        guard let typedCell = cell as? CellClass else {
            fatalError("Could not deque cell with type \(CellClass.self)")
        }
        return typedCell
    }
    
    func dequeueAndConfigureCollectionViewCell(forItem item: CollectionViewItem,
                                               indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: item.reusableIdentifier, for: indexPath)
        if let cell = cell as? CollectionViewCell {
            cell.configure(item: item)
        } else {
            assertionFailure()
        }
        return cell
    }
}
