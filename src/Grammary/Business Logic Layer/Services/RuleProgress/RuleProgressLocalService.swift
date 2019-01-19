//
//  RuleProgressLocalService.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/6/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol RuleProgressLocalService: PersistenceService {
    func getAllProgressesFor(questionId: String) -> [RuleProgress]
    func getAllProgresses() -> [RuleProgress]
}

final class RuleProgressLocalServiceImpl: RuleProgressLocalService {
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - RuleProgressLocalService
    
    func getAllProgressesFor(questionId: String) -> [RuleProgress] {
        return getRealm()
            .objects(RuleProgress.self)
            .filter { progress -> Bool in
                return progress.rule?.questions.contains(where: { $0.id == questionId } ) ?? false
            }
            .map { $0 }
    }
    
    func getAllProgresses() -> [RuleProgress] {
        return getRealm()
            .objects(RuleProgress.self)
            .map { $0 }
    }
}
