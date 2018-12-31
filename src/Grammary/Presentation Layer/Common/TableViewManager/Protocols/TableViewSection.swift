//
//  TableViewSection.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 31/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import CoreGraphics

protocol TableViewSection {
    var name: String? { get }
    
    var sectionHeight: CGFloat { get }
    
    var items: [TableViewItem] { get }
    
    var didSelectItem: ((Int) -> Void)? { get }
}

struct CommonSection<ItemType: TableViewItem>: TableViewSection {

    // MARK: - TableViewSection
    
    var name: String? = nil
    
    var sectionHeight: CGFloat = 0
    
    var items: [TableViewItem]
    
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
