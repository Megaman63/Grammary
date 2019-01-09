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
        
        var totalProgress = 0.0
        state.rulesSet.progress.forEach { totalProgress = totalProgress + $0.percentOfProgress }
        totalProgress = totalProgress / Double(state.rulesSet.progress.count)
        
        let rulesSetId = state.rulesSet.id
        let headerItem = RulesSetHeaderItem(
            name: state.rulesSet.name,
            totalProgress: totalProgress) { [weak router] in
                router?.showExercise(rulesSetId: rulesSetId)
        }
        
        
        let ruleItems: [RuleProgressItem] = state.rulesSet.progress.map {
            RuleProgressItem(name: $0.rule?.ruleDescription ?? "",
                             errorCount: $0.errorCount,
                             correctAnswers: $0.progress)
        }
        
        let items: [TableViewItem] = [headerItem] + ruleItems
        let section = CommonAnyTypeSection(items: items, didSelectItem: nil)
        view?.setDataSource([section])
    }
}
