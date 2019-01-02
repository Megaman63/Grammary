//
//  Example.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 27/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class Example: Object {
    
    @objc dynamic var text: String = ""
    
    convenience init(text: String) {
        self.init()
        
        self.text = text
    }
}
