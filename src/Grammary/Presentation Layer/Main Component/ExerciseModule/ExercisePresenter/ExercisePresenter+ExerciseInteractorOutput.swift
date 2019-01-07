//
//  ExercisePresenter+ExerciseInteractorOutput.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

extension ExercisePresenterImpl: ExerciseInteractorOutput {

    // MARK: - ExerciseInteractorOutput

    func didLoad(rules: [Rule]) {
        let questions = rules
            .map { $0.questions }
            .joined()
            .shuffled()
        
        if questions.count > ExersiceConstants.countOfQuestions {
            state.questions = questions[0..<ExersiceConstants.countOfQuestions].map { QuestionItem(question: $0) }
        } else {
            var items = questions.map { QuestionItem(question: $0) }
            for _ in 0..<ExersiceConstants.countOfQuestions - questions.count {
                let randomIndex = Int(arc4random() % UInt32(questions.count))
                let item = QuestionItem(question: questions[randomIndex])
                items.append(item)
            }
            state.questions = items
        }

        guard let currentQuestionItem = state.currentQuestionItem else {
            assertionFailure()
            return
        }
        view?.show(question: currentQuestionItem)
    }
}
