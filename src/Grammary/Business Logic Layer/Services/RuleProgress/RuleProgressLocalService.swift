//
//  RuleProgressLocalService.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/6/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol RuleProgressLocalService {
    func getAllProgressesFor(questionId: String) -> [RuleProgress]
    func getAllProgresses() -> [RuleProgress]
    func getProgress(forRule rule: Rule) -> RuleProgress?
    
    func update(_ object: RuleProgress, _ block: ((RuleProgress) -> Void)?)
    func update(_ objects: [RuleProgress], _ block: (([RuleProgress]) -> Void)?)
}

final class RuleProgressLocalServiceImpl: RuleProgressLocalService, PersistenceService {
    
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
    
    func getProgress(forRule rule: Rule) -> RuleProgress? {
        let predicate = NSPredicate(format: "\(#keyPath(RuleProgress.rule.id)) == \"\(rule.id)\"")
        return getRealm()
            .objects(RuleProgress.self)
            .filter(predicate)
            .first
    }
    
    // MARK: - PersistenceService
    
    typealias RealmObject = RuleProgress
}
