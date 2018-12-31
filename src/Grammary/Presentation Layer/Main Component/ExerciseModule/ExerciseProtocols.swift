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
}

// MARK: - Interactor

protocol ExerciseInteractor: AnyObject {
    func loadQuestions(forSetWithId id: String)
}

// MARK: - InteractorOutput

protocol ExerciseInteractorOutput: AnyObject {
    func didLoad(questions: [Question])
}

// MARK: - View

protocol ExerciseView: AnyObject {
    func showQuestion(_ question: Question, animation: QuestionAppearanceAnimation)
	var presenter: ExercisePresenter? { get set }
}
