//
//  CollectionViewSection.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/23/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import CoreGraphics

protocol CollectionViewSection {
    var name: String? { get }
    
    var sectionHeight: CGFloat { get }
    
    var items: [CollectionViewItem] { get }
    
    var didSelectItem: ((Int) -> Void)? { get }
}

struct CommonCollectionViewSection<ItemType: CollectionViewItem>: CollectionViewSection {
    
    // MARK: - CollectionViewSection
    
    var name: String? = nil
    
    var sectionHeight: CGFloat = 0
    
    var items: [CollectionViewItem]
    
    var genericItems: [ItemType] {
        return items as? [ItemType] ?? []
    }
    
    var didSelectItem: ((Int) -> Void)?
    
    // MARK: - Init
    
    init(name: String? = nil, sectionHeight: CGFloat = 0, items: [ItemType], didSelectItem: ((Int) -> Void)?) {
        self.name = name
        self.sectionHeight = sectionHeight
        self.items = items
        self.didSelectItem = didSelectItem
    }
}

struct CommonAnyTypeCollectionViewSection: CollectionViewSection {
    
    // MARK: - CollectionViewSection
    
    var name: String? = nil
    
    var sectionHeight: CGFloat = 0
    
    var items: [CollectionViewItem]
    
    var didSelectItem: ((Int) -> Void)?
    
    // MARK: - Init
    
    init(name: String? = nil,
         sectionHeight: CGFloat = 0,
         items: [CollectionViewItem],
         didSelectItem: ((Int) -> Void)?) {
        
        self.name = name
        self.sectionHeight = sectionHeight
        self.items = items
        self.didSelectItem = didSelectItem
    }
}
