//
//  AccountLocalService.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol AccountLocalService: AnyObject {
    func obtainAccount() -> Account
    func update(_ object: Account, _ block: ((Account) -> Void)?)
}

final class AccountLocalServiceImpl: AccountLocalService, PersistenceService {
    
    // MARK: - Private properties
    
    
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - AccountLocalService
    
    func obtainAccount() -> Account {
        if let account = getRealm().objects(Account.self).first {
            return account
        }
        
        let account = Account()
        write {
            getRealm().add(account)
        }
        
        return account
    }
    
    // MARK: - PersistenceService
    
    typealias RealmObject = Account
}
