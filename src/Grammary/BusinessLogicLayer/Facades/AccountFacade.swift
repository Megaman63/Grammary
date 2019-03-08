//
//  AccountFacade.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol AccountFacade: AnyObject {
    func obtainAccount() -> Account
    func updateAccount(block: @escaping (Account) -> Void)
    func addTimeSpentOnExersice(time: Double)
}

final class AccountFacadeImpl: AccountFacade {
    
    // MARK: - Private properties
    
    private let accountLocalService: AccountLocalService
    
    // MARK: - Init
    
    init(accountLocalService: AccountLocalService) {
        self.accountLocalService = accountLocalService
    }
    
    // MARK: - AccountFacade
    
    func obtainAccount() -> Account {
        return accountLocalService.obtainAccount()
    }
    
    func addTimeSpentOnExersice(time: Double) {
        let account = accountLocalService.obtainAccount()
        accountLocalService.update(account) { account in
            account.timeSpentInApplication += time
        }
    }
    
    func updateAccount(block: @escaping (Account) -> Void) {
        let account = accountLocalService.obtainAccount()
        accountLocalService.update(account, block)
    }
}
