//
//  QuestionItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/6/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

struct QuestionItem {
    let id: String
    let ruleTitle: String
    let ruleSubject: String
    private let correctAnswerId: String
    let answers: [Answer]
    let examples: [RuleExample]
    
    init(question: Question) {
        self.id = question.id
        self.ruleTitle = question.ruleTitle
        self.ruleSubject = question.ruleSubject
        self.correctAnswerId = question.answers[question.correctAnswer].id
        self.answers = question.shuffleAnswers ? question.answers.toArray().shuffled() : question.answers.toArray()
        self.examples = question.examples.toArray()
    }
    
    var correctAnswer: Int {
        return answers.index(where: { $0.id == correctAnswerId}) ?? 0
    }
    
    var correctAnswerText: String {
        return answers.first(where: { $0.id == correctAnswerId})?.text ?? ""
    }
}

