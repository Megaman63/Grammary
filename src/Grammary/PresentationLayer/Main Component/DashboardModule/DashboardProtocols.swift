//
//  DashboardProtocols.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

// MARK: - Router

protocol DashboardRouter: AnyObject {
    func showRulesSetInfo(rulesSetId: String)
    func showRulesSets()
}

// MARK: - Presenter

protocol DashboardPresenter: AnyObject {
    func didTriggerViewWillAppearEvent()
    func didTapStudyButton()
}

// MARK: - Interactor

protocol DashboardInteractor: AnyObject {
    func obtainAccount() -> Account
    
    func obtainTotalProgress() -> Double
    func obtainTotalCountOfCompletedRules() -> Int
    func ontainNextReviseRecommendedRulesSet() -> RulesSet?
}

// MARK: - InteractorOutput

protocol DashboardInteractorOutput: AnyObject {

}

// MARK: - View

protocol DashboardView: AnyObject {
	var presenter: DashboardPresenter? { get set }
    
    func configure(state: DashboardState)
}
