//
//  Question.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 27/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation

struct Question: Codable {
    let id: String
    let questionTitle: String
    let questionSubject: String
    let answers: [Answer]
    let correctAnswer: Int
    let description: String
    let examples: [Example]
    
    init(id: String,
         questionTitle: String,
         questionSubject: String,
         answers: [Answer],
         correctAnswer: Int,
         description: String,
         examples: [Example]) {
        self.id = id
        self.questionTitle = questionTitle
        self.questionSubject = questionSubject
        self.answers = answers
        self.correctAnswer = correctAnswer
        self.description = description
        self.examples = examples
    }
}
