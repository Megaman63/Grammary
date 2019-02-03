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
    weak var exampleModuleInput: ExampleModuleInput?
    let interactor: ExerciseInteractor
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
        interactor.loadRules(forSetWithId: state.rulesSetId)
    }
    
    func didChooseAnswer(atIndex index: Int) {
        guard
            let currentQuestionItem = state.currentQuestionItem,
            index < currentQuestionItem.answers.count else {
                return
        }
        
        let animation: RuleAppearanceAnimation
        if currentQuestionItem.correctAnswer == index {
            animation = .correctAnswer(correctIndex: index)
        } else {
            animation = .wrongAnswer(correctIndex: currentQuestionItem.correctAnswer, wrongIndex: index)
        }
        
        interactor.setProgress(questionId: currentQuestionItem.id,
                               isCorrectAnswer: currentQuestionItem.correctAnswer == index)
        
        view?.showAnswer(animation: animation)
    }
    
    func didShowAnswer() {
        guard let currentQuestionItem = state.currentQuestionItem else {
            return
        }
        view?.showExample()
        exampleModuleInput?.set(currentQuestionId: currentQuestionItem.id)
    }
    
    func didTapNextButton() {
        state.currentQuestionItemIndex = state.currentQuestionItemIndex + 1
        guard let nextQuestionItem = state.currentQuestionItem else {
            router.dismissView()
            interactor.finishExercies(ruleSetId: state.rulesSetId)
            return
        }
        view?.show(question: nextQuestionItem)
    }
    
    func didTapCloseButton() {
        router.dismissView()
    }
}
