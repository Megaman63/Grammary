//
//  RuleLocalService.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol RuleLocalService {
    func obtainRules(ids: [String]) -> [Rule]
}

final class RuleLocalServiceImpl: RuleLocalService, PersistenceService {
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - RuleLocalService
 
    func obtainRules(ids: [String]) -> [Rule] {
        let predicate = NSPredicate(format: "\(#keyPath(Rule.id)) IN %@", ids)
        return
            getRealm()
                .objects(Rule.self)
                .filter(predicate)
                .toArray()
                .shuffled()
    }
    
    // MARK: - PersistenceService
    
    typealias RealmObject = Rule
}
