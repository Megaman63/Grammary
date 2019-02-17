//
//  ExerciseProtocols.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

// MARK: - Router

protocol ExerciseRouter: AnyObject {
    func dismissView()
}

// MARK: - Presenter

protocol ExercisePresenter: AnyObject {
    func didTriggerViewReadyEvent()
    func didChooseAnswer(atIndex index: Int)
    func didShowAnswer(partialRevealDrawerHeight: CGFloat)
    func didTapCloseButton()
}

// MARK: - Interactor

protocol ExerciseInteractor: AnyObject {
    func loadRules(forSetWithId id: String)
    func finishExercies(ruleSetId: String)
    func setProgress(questionId: String, isCorrectAnswer: Bool)
}

// MARK: - InteractorOutput

protocol ExerciseInteractorOutput: AnyObject {
    func didLoad(progress: [RuleProgress])
}

// MARK: - View

protocol ExerciseView: AnyObject {
    var presenter: ExercisePresenter? { get set }
    
    func show(question: QuestionItem)
    func showAnswer(ruleAppearance: RuleAppearance, animated: Bool)
    func set(progress: CGFloat)
    func showExample(animated: Bool)
}
