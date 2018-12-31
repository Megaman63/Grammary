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

    func didLoad(questions: [Question]) {
        state.questions = questions
        
        guard let currentQuestion = state.questions.first else {
            return
        }
        
        view?.showQuestion(currentQuestion, animation: .none)
    }
}
