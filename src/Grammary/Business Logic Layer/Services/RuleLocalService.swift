//
//  RuleLocalService.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol RuleLocalService: AnyObject {
    func obtainRules(ids: [String]) -> [Rule]
    func update(_ block: () -> (Rule))
}

final class RuleLocalServiceImpl: PersistenceService, RuleLocalService {
    
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
    
    func update(_ block: () -> (Rule)) {
        let realm = getRealm()
        try? realm.write {
            let rule = block()
            realm.add(rule, update: true)
        }
    }
}
