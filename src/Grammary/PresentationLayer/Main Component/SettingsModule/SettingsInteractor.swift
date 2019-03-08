//
//  SettingsInteractor.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class SettingsInteractorImpl: SettingsInteractor {

    weak var output: SettingsInteractorOutput?

    // MARK: - Private properties
    
    private let accountFacade: AccountFacade
    private let progressFacade: ProgressFacade
    
    // MARK: - Init
    
    init(accountFacade: AccountFacade,
         progressFacade: ProgressFacade) {
        
        self.accountFacade = accountFacade
        self.progressFacade = progressFacade
    }
    
    // MARK: - SettingsInteractor
    
    func obtainAccount() -> Account {
        return accountFacade.obtainAccount()
    }
    
    func resetAllProgresses() {
        progressFacade.resetAllProgresses()
    }
    
    func updateAccount(block: @escaping (Account) -> Void) {
        accountFacade.updateAccount(block: block)
    }
}
