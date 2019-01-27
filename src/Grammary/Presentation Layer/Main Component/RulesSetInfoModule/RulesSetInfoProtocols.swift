//
//  RulesSetInfoProtocols.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

// MARK: - Router

protocol RulesSetInfoRouter: AnyObject {
    func dismissView()
    func showExercise(rulesSetId: String) 
}

// MARK: - Presenter

protocol RulesSetInfoPresenter: AnyObject {
    func didTriggerViewReadyEvent()
}

// MARK: - Interactor

protocol RulesSetInfoInteractor: AnyObject {
    func subscribeOnRuleSet(withId id: String)
}

// MARK: - InteractorOutput

protocol RulesSetInfoInteractorOutput: AnyObject {
    func didChangeRulesSet(changes: PrimaryKeyObserverNotification<RulesSet>)
}

// MARK: - View

protocol RulesSetInfoView: AnyObject {
	var presenter: RulesSetInfoPresenter? { get set }
    func setDataSource(_ dataSource: [TableViewSection])
}
