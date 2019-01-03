//
//  Array+toRealmList.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

extension Array where Element: Object {
    
    func toRealmList() -> List<Element> {
        let list = List<Element>()
        for element in self {
            list.append(element)
        }
        return list
    }
}

extension Results {
    
    func toArray() -> [Element] {
        return Array(self)
    }
}

extension List {
    
    func toArray() -> [Element] {
        return Array(self)
    }
}
