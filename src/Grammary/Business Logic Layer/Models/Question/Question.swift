//
//  Question.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 27/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class Question: Object {
    
    override static func primaryKey() -> String? { return "id" }
    
    @objc dynamic var id: String = ""
    @objc dynamic var questionTitle: String = ""
    @objc dynamic var questionSubject: String = ""
    @objc dynamic var correctAnswer: Int = -1
    @objc dynamic var questionDescription: String = ""
    
    var answers = List<Answer>()
    var examples = List<Example>()
    
    convenience init(id: String,
                     questionTitle: String,
                     questionSubject: String,
                     answers: List<Answer>,
                     correctAnswer: Int,
                     questionDescription: String,
                     examples: List<Example>) {
        
        self.init()
        
        self.id = id
        self.questionTitle = questionTitle
        self.questionSubject = questionSubject
        self.answers = answers
        self.correctAnswer = correctAnswer
        self.questionDescription = questionDescription
        self.examples = examples
    }
}
