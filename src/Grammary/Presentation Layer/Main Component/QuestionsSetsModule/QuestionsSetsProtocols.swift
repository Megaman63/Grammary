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
    func dismissView()
}

// MARK: - Presenter

protocol QuestionsSetsPresenter: AnyObject {

}

// MARK: - Interactor

protocol QuestionsSetsInteractor: AnyObject {

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
