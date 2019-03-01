//
//  RulesSetItem.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 31/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct RulesSetItem: CollectionViewItem {
    let id: String
    let name: String
    let sibtitle: String
    let totalProgress: Double
    let index: Int
    let searchText: String
    
    // MARK: - CollectionViewItem
    
    static let cellClass: CollectionViewCellConformable.Type = RulesSetCollectionViewCell.self
}
