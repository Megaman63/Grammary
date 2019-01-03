//
//  Question.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class Question: Object {
    override static func primaryKey() -> String? { return "id" }
    
    @objc dynamic var id: String = ""
    @objc dynamic var ruleTitle: String = ""
    @objc dynamic var ruleSubject: String = ""
    @objc dynamic var correctAnswer: Int = -1
    
    var answers = List<Answer>()
    
    convenience init(id: String,
                     ruleTitle: String,
                     ruleSubject: String,
                     correctAnswer: Int,
                     answers: List<Answer>) {
        self.init()
        
        self.id = id
        self.ruleTitle = ruleTitle
        self.ruleSubject = ruleSubject
        self.correctAnswer = correctAnswer
        self.answers = answers
    }
}