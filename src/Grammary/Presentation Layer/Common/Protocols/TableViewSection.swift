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
    var items: [TableViewItem] { get}
    var didSelectItem: ((_ itemIndex: Int) -> Void)? { get }
}

