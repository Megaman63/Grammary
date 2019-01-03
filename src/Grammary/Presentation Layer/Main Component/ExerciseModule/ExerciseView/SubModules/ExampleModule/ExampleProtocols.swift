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
    func didTapClearProgressButton()
    func didTapAlreadyKnowButton()
}

// MARK: - ExampleModuleInput

protocol ExampleModuleInput: AnyObject {
    func set(examples: [RuleExample], correctAnswer: String)
}

// MARK: - Interactor

protocol ExampleInteractor: AnyObject {

}

// MARK: - InteractorOutput

protocol ExampleInteractorOutput: AnyObject {

}

// MARK: - View

protocol ExampleView: AnyObject {
	var presenter: ExamplePresenter? { get set }
    func setDataSource(_ dataSource: [TableViewSection])
}
