//
//  ExampleProtocols.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

// MARK: - Router

protocol ExampleRouter: AnyObject {
    func dismissView()
}

// MARK: - Presenter

protocol ExamplePresenter: AnyObject {
}

// MARK: - ExampleModuleInput

protocol ExampleModuleInput: AnyObject {
    func set(currentQuestionId: String)
}

// MARK: - Interactor

protocol ExampleInteractor: AnyObject {
    func obtainQuestion(withId id: String) -> Question?
    func obtainProgresses(forRulesSetId id: String) -> [RuleProgress] 
    func excludeRuleFromRulesSet(whichHasQuestionWithId questionId: String)
    func resetProgress(forQuestionId questionId: String)
    func setMaximumProgress(forQuestionId questionId: String)
    func reportError(questionId: String)
}

// MARK: - InteractorOutput

protocol ExampleInteractorOutput: AnyObject {

}

// MARK: - View

protocol ExampleView: AnyObject {
	var presenter: ExamplePresenter? { get set }
    func setDataSource(_ dataSource: [TableViewSection])
}
