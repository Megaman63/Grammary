//
//  RulesSetsProtocols.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

// MARK: - Router

protocol RulesSetsRouter: AnyObject {
    func showRulesSetInfo(rulesSet: RulesSet)
}

// MARK: - Presenter

protocol RulesSetsPresenter: AnyObject {
    func didTriggerViewReadyEvent()
}

// MARK: - Interactor

protocol RulesSetsInteractor: AnyObject {
    func requestRulesSets()
}

// MARK: - InteractorOutput

protocol RulesSetsInteractorOutput: AnyObject {
    func didLoadRulesSets(_ sets: [RulesSet])
}

// MARK: - View

protocol RulesSetsView: AnyObject {
	var presenter: RulesSetsPresenter? { get set }
    func setDataSource(_ dataSource: [TableViewSection])
}
