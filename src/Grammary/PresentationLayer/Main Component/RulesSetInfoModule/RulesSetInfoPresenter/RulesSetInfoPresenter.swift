//
//  RulesSetInfoPresenter.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetInfoPresenterImpl: RulesSetInfoPresenter {

    weak var view: RulesSetInfoView?
    let interactor: RulesSetInfoInteractor
    let router: RulesSetInfoRouter

    // MARK: - State

    var state: RulesSetInfoState

    // MARK: - Init

    init(view: RulesSetInfoView,
         interactor: RulesSetInfoInteractor,
         router: RulesSetInfoRouter,
         state: RulesSetInfoState) {

        self.view = view
        self.interactor = interactor
        self.router = router
        self.state = state
    }

    // MARK: - RulesSetInfoPresenter

    func didTriggerViewReadyEvent() {
        interactor.subscribeOnRuleSet(withId: state.rulesSetId)
    }
}
 
