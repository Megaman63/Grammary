//
//  Answer.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 27/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class Answer: Object {
    
    override static func primaryKey() -> String? { return "id" }
    
    @objc dynamic var id: String = ""
    @objc dynamic var text: String = ""
    
    convenience init(id: String, text: String) {
        self.init()
        
        self.id = id
        self.text = text
    }
}
