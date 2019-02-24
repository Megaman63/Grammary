//
//  CollectionViewItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/23/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

typealias CollectionViewCellConformable = UICollectionViewCell & CollectionViewCell

protocol CollectionViewItem {
    static var cellClass: CollectionViewCellConformable.Type { get }
}

extension CollectionViewItem {
    var reusableIdentifier: String {
        return String(describing: Self.cellClass)
    }
}
