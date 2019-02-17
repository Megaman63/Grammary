//
//  RulesSetsPresenter.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetsPresenterImpl: RulesSetsPresenter {

    weak var view: RulesSetsView?
    var interactor: RulesSetsInteractor
    let router: RulesSetsRouter

    // MARK: - State

    var state: RulesSetsState

    // MARK: - Init

    init(view: RulesSetsView,
         interactor: RulesSetsInteractor,
         router: RulesSetsRouter,
         state: RulesSetsState) {

        self.view = view
        self.interactor = interactor
        self.router = router
        self.state = state
    }

    // MARK: - RulesSetsPresenter
    
    func didTriggerViewReadyEvent() {
        interactor.subscribeOnAllRulesSets()
    }
}
