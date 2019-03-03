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
            index < currentQuestionItem.answers.count
        else {
            return
        }
        
        let ruleAppearance: RuleAppearance
        if currentQuestionItem.correctAnswer == index {
            ruleAppearance = .correctAnswer(correctIndex: index)
        } else {
            ruleAppearance = .wrongAnswer(correctIndex: currentQuestionItem.correctAnswer, wrongIndex: index)
        }
        
        interactor.setProgress(questionId: currentQuestionItem.id,
                               isCorrectAnswer: currentQuestionItem.correctAnswer == index)
        
        view?.showAnswer(ruleAppearance: ruleAppearance, animated: !currentQuestionItem.shouldShowExampleFirst)
    }
    
    func didShowAnswer(partialRevealDrawerHeight: CGFloat) {
        guard let currentQuestionItem = state.currentQuestionItem else {
            return
        }
        exampleModuleInput?.set(currentQuestionId: currentQuestionItem.id,
                                partialRevealDrawerHeight: partialRevealDrawerHeight)
        view?.showExample(animated: !currentQuestionItem.shouldShowExampleFirst)
    }
    
    func didTapCloseButton() {
        router.dismissView()
    }
    
    func didTriggerViewDeinitEvent() {
        interactor.addTimeSpentOnExersice(time: -state.exersiceStartDate.timeIntervalSinceNow)
    }
    
    // MARK: - Public functions
    
    func show(question: QuestionItem) {
        view?.show(question: question)
        let progress = CGFloat(state.currentQuestionItemIndex) / CGFloat(state.questions.count)
        view?.set(progress: progress)
        if question.shouldShowExampleFirst {
            didChooseAnswer(atIndex: question.correctAnswer)
        }
    }
}

extension ExercisePresenterImpl: ExampleModuleOutput {
    
    // MARK: - ExampleModuleOutput
    
    func didTapNextButton() {
        state.currentQuestionItemIndex += 1
        guard let nextQuestionItem = state.currentQuestionItem else {
            router.dismissView()
            interactor.finishExercies(ruleSetId: state.rulesSetId)
            return
        }
        show(question: nextQuestionItem)
    }
}
