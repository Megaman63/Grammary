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
    @objc dynamic var ruleTitle: String = ""
    @objc dynamic var ruleSubject: String = ""
    @objc dynamic var correctAnswer: Int = -1
    @objc dynamic var ruleDescription: String = ""
    
    var answers = List<Answer>()
    var examples = List<Example>()
    
    convenience init(id: String,
                     ruleTitle: String,
                     ruleSubject: String,
                     answers: List<Answer>,
                     correctAnswer: Int,
                     ruleDescription: String,
                     examples: List<Example>) {
        
        self.init()
        
        self.id = id
        self.ruleTitle = ruleTitle
        self.ruleSubject = ruleSubject
        self.answers = answers
        self.correctAnswer = correctAnswer
        self.ruleDescription = ruleDescription
        self.examples = examples
    }
}
