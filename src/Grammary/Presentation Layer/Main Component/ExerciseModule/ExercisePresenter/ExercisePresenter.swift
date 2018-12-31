//
//  ExercisePresenter.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExercisePresenterImpl: ExercisePresenter {

    weak var view: ExerciseView?
    var interactor: ExerciseInteractor
    let router: ExerciseRouter

    // MARK: - State

    var state: ExerciseState

    // MARK: - Init

    init(view: ExerciseView,
         interactor: ExerciseInteractor,
         router: ExerciseRouter,
         state: ExerciseState) {

        self.view = view
        self.interactor = interactor
        self.router = router
        self.state = state
    }

    // MARK: - ExercisePresenter

    func didTriggerViewReadyEvent() {
        interactor.loadQuestions(forSetWithId: state.questionsSetId)
    }
    
    func didChooseAnswer(atIndex index: Int) {
        guard let currentQuestion = state.currentQuestion,  index < currentQuestion.answers.count else {
            return
        }

        state.currentQuestionIndex = state.currentQuestionIndex + 1
        guard let nextQuestion = state.currentQuestion else {
            router.dismissView()
            return
        }
        
        let animation: QuestionAppearanceAnimation
        if currentQuestion.correctAnswer == index {
            animation = .correctAnswer(correctIndex: index)
        } else {
            animation = .wrongAnswer(correctIndex: currentQuestion.correctAnswer, wrongIndex: index)
        }
        
        view?.showQuestion(nextQuestion, animation: animation)
    }
}
