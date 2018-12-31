//
//  ExerciseState.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

enum QuestionAppearanceAnimation {
    case none
    case wrongAnswer(correctIndex: Int, wrongIndex: Int)
    case correctAnswer(correctIndex: Int)
}

struct ExerciseState {
    var currentQuestionIndex = 0
    var questions: [Question]
    
    var currentQuestion: Question? {
        guard currentQuestionIndex < questions.count else {
            return nil
        }
        
        return questions[currentQuestionIndex]
    }
}
