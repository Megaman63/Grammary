//
//  CommonStruct.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 31/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import CoreGraphics

struct CommonSection<ItemType: TableViewItem> {
    
    // MARK: - TableViewSection
    
    var name: String? = nil
    
    var sectionHeight: CGFloat = 0
    
    var items: [ItemType]
    
    var didSelectItem: ((Int) -> Void)?
    
    init(name: String? = nil, sectionHeight: CGFloat = 0, items: [ItemType], didSelectItem: ((Int) -> Void)?) {
        self.name = name
        self.sectionHeight = sectionHeight
        self.items = items
        self.didSelectItem = didSelectItem
    }
}
