//
//  RuleProgressItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct RuleProgressItem: CollectionViewItem {
    
    let name: String
    var errorCount: Int
    var correctAnswers: Int
    let index: Int
    
    // MARK: - CollectionViewItem
    
    static let cellClass: CollectionViewCellConformable.Type = RuleProgressCollectionViewCell.self
}
