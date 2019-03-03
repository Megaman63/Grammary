//
//  DashboardInteractor.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class DashboardInteractorImpl: DashboardInteractor {

    weak var output: DashboardInteractorOutput?

    private let progressFacade: ProgressFacade
    private let accountFacade: AccountFacade
    
    // MARK: - DashboardInteractor
    
    init(progressFacade: ProgressFacade,
         accountFacade: AccountFacade) {
        
        self.progressFacade = progressFacade
        self.accountFacade = accountFacade
    }
    
    // MARK: - DashboardInteractor
    
    func obtainAccount() -> Account {
        return accountFacade.obtainAccount()
    }
    
    func obtainTotalProgress() -> Double {
        return progressFacade.obtainTotalProgress()
    }
    
    func obtainTotalCountOfCompletedRules() -> Int {
        return progressFacade.obtainTotalCountOfCompletedRules()
    }
    
    func ontainNextReviseRecommendedRulesSet() -> RulesSet? {
        return progressFacade.ontainNextReviseRecommendedRulesSet()
    }
}
