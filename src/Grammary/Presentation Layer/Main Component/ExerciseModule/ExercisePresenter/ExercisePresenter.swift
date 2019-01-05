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
        interactor.loadRules(forSetWithId: state.rulesSetId)
    }
    
    func didChooseAnswer(atIndex index: Int) {
        guard
            let currentRule = state.currentRule,
            let currentQuestion = state.currentQuestion,
            index < currentQuestion.answers.count else {
                return
        }
        
        let animation: RuleAppearanceAnimation
        if currentQuestion.correctAnswer == index {
            animation = .correctAnswer(correctIndex: index)
        } else {
            animation = .wrongAnswer(correctIndex: currentQuestion.correctAnswer, wrongIndex: index)
        }
        
        interactor.setProgress(forRulesSetId: state.rulesSetId,
                               ruleId: currentRule.id,
                               isCorrectAnswer: currentQuestion.correctAnswer == index)
        
        view?.showAnswer(animation: animation)
    }
    
    func didShowAnswer() {
        guard let currentQuestion = state.currentQuestion else {
            return
        }
        view?.showExample()
        exampleModuleInput?.set(examples: currentQuestion.examples.toArray(),
                                correctAnswer: currentQuestion.answers[currentQuestion.correctAnswer].text)
    }
    
    func didTapNextButton() {
        state.currentRuleIndex = state.currentRuleIndex + 1
        guard let nextRule = state.currentRule else {
            router.dismissView()
            return
        }
        state.currentQuestionIndex = Int( arc4random() % UInt32(nextRule.questions.count) )
        
        guard let nextQuestion = state.currentQuestion else {
            assertionFailure()
            return
        }
        
        view?.show(question: nextQuestion)
    }
}
