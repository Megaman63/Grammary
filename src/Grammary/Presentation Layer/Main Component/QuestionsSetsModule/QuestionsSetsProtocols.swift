//
//  QuestionsSetsProtocols.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

// MARK: - Router

protocol QuestionsSetsRouter: AnyObject {
    func showExercise(questionsSetId: String)
}

// MARK: - Presenter

protocol QuestionsSetsPresenter: AnyObject {
    func didTriggerViewReadyEvent()
}

// MARK: - Interactor

protocol QuestionsSetsInteractor: AnyObject {
    func requestQuestionsSets()
}

// MARK: - InteractorOutput

protocol QuestionsSetsInteractorOutput: AnyObject {
    func didLoadQuestionsSets(_ sets: [QuestionsSet])
}

// MARK: - View

protocol QuestionsSetsView: AnyObject {
	var presenter: QuestionsSetsPresenter? { get set }
    func setDataSource(_ dataSource: [TableViewSection])
}
