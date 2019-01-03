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
    func didShowAnswer()
    func didTapNextButton()
}

// MARK: - Interactor

protocol ExerciseInteractor: AnyObject {
    func loadRules(forSetWithId id: String)
    func setProgress(forRulesSetId id: String, ruleId: String, isCorrectAnswer: Bool)
}

// MARK: - InteractorOutput

protocol ExerciseInteractorOutput: AnyObject {
    func didLoad(rules: [Rule])
}

// MARK: - View

protocol ExerciseView: AnyObject {
    var presenter: ExercisePresenter? { get set }
    
    func show(question: Question)
    func showAnswer(animation: RuleAppearanceAnimation)
    func showExample()
}
