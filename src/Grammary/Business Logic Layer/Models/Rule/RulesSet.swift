//
//  RulesSet.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class RulesSet: Object {
    override static func primaryKey() -> String? { return "id" }
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    var progress = List<RuleProgress>()
    
    convenience init(id: String,
                     name: String,
                     progress: List<RuleProgress>) {
        self.init()
        
        self.id = id
        self.name = name
        self.progress = progress
    }
}
