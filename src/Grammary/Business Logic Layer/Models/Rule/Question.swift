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
    @objc dynamic var correctAnswerIndex: Int = -1
    @objc dynamic var shuffleAnswers: Bool = false
    
    var answers = List<Answer>()
    var examples = List<RuleExample>()
    
    var correctAnswer: Answer? {
        guard correctAnswerIndex < answers.count, correctAnswerIndex >= 0 else {
            assertionFailure()
            return nil
        }
        return answers[correctAnswerIndex]
    }
    
    convenience init(id: String,
                     ruleTitle: String,
                     ruleSubject: String,
                     correctAnswerIndex: Int,
                     shuffleAnswers: Bool,
                     answers: List<Answer>,
                     examples: List<RuleExample>) {
        self.init()
        
        self.id = id
        self.ruleTitle = ruleTitle
        self.ruleSubject = ruleSubject
        self.correctAnswerIndex = correctAnswerIndex
        self.shuffleAnswers = shuffleAnswers
        self.answers = answers
        self.examples = examples
    }
}
