//
//  Collection+Extension.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
