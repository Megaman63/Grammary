//
//  Rule.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 27/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class Rule: Object {
    
    override static func primaryKey() -> String? { return "id" }
    
    @objc dynamic var id: String = ""
    @objc dynamic var ruleDescription: String = ""
    
    var questions = List<Question>()
    
    convenience init(id: String,
                     ruleDescription: String,
                     questions: List<Question>) {
        self.init()
        
        self.id = id
        self.ruleDescription = ruleDescription
        self.questions = questions
    }
}
