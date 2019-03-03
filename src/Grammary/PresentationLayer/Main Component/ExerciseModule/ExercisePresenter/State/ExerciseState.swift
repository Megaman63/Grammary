//
//  ExerciseState.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

enum RuleAppearance {
    case wrongAnswer(correctIndex: Int, wrongIndex: Int)
    case correctAnswer(correctIndex: Int)
}

struct ExerciseState {
    let exersiceStartDate = Date()
    let rulesSetId: String
    
    var questions: [QuestionItem] = []
    var currentQuestionItemIndex = 0
    
    var currentQuestionItem: QuestionItem? {
        guard currentQuestionItemIndex < questions.count else {
            return nil
        }
        
        return questions[currentQuestionItemIndex]
    }
    
    init(rulesSetId: String) {
        self.rulesSetId = rulesSetId
    }
}
