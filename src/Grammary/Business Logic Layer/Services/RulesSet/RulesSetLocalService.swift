//
//  RulesSetLocalService.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol RulesSetLocalService: AnyObject {
    func obtainRulesSet(forId id: String) -> RulesSet?
    func obtainRulesSet() -> [RulesSet]
    func update(block: CommonBlock)
}

final class RulesSetLocalServiceImpl: PersistenceService, RulesSetLocalService {
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - RulesSetLocalService
    
    func obtainRulesSet(forId id: String) -> RulesSet? {
        return getRealm().object(ofType: RulesSet.self, forPrimaryKey: id)
    }
    
    func obtainRulesSet() -> [RulesSet] {
        return getRealm()
            .objects(RulesSet.self)
            .toArray()
    }
    
    func update(block: CommonBlock) {
        write(block)
    }
}
