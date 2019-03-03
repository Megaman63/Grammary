//
//  DashboardPresenter.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class DashboardPresenterImpl: DashboardPresenter {

    weak var view: DashboardView?
    var interactor: DashboardInteractor
    let router: DashboardRouter

    // MARK: - State

    var state: DashboardState!

    // MARK: - Init

    init(view: DashboardView,
         interactor: DashboardInteractor,
         router: DashboardRouter) {

        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: - DashboardPresenter

    func didTriggerViewWillAppearEvent() {
        buildState()
        view?.configure(state: state)
    }
    
    func didTapStudyButton() {
        if let nextReviseRecommendedRulesSetId = state.nextReviseRecommendedRulesSetId {
            router.showRulesSetInfo(rulesSetId: nextReviseRecommendedRulesSetId)
        } else {
            router.showRulesSets()
        }
    }
    
    // MARK: - Private functions
    
    private func buildState() {
        let account = interactor.obtainAccount()
        
        let nextReviseRecommendedRulesSet = interactor.ontainNextReviseRecommendedRulesSet()
        let nextReviseRecommendedDate = nextReviseRecommendedRulesSet?.nextReviseRecommendedDate
        let reviseRecommendation = ReviseRecommendation(reviseRecommendationDate: nextReviseRecommendedDate)
        
        let currentDate = Date()
        let hour = Calendar.current.component(.hour, from: currentDate)
        let isDay = hour < 17
        
        let diffInDays = Calendar
            .current
            .dateComponents([.day], from: account.installationDate, to: currentDate).day ?? 0
        
        
        self.state = DashboardState(
            userName: account.name,
            totalProgress: interactor.obtainTotalProgress(),
            totalCountOfDays: diffInDays,
            totalExerciseTime: account.timeSpentInApplication,
            totalCountOfCompletedRules: interactor.obtainTotalCountOfCompletedRules(),
            reviseRecommendation: reviseRecommendation,
            isDay: isDay,
            nextReviseRecommendedRulesSetId: nextReviseRecommendedRulesSet?.id
        )
    }
}

