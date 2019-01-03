//
//  ExerciseFacade.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

protocol ExerciseFacade: AnyObject {
    func obtainRulesSet() -> [RulesSet]
    func obtainRules(forRulesSetId id: String) -> [Rule]
    func setProgress(forRulesSetId id: String, ruleId: String, isCorrectAnswer: Bool) 
}

final class ExerciseFacadeImpl: ExerciseFacade {
    
    // MARK: - Private properties
    
    private let ruleLocalService: RuleLocalService
    private let rulesSetLocalService: RulesSetLocalService
    
    // MARK: - Init
    
    init(ruleLocalService: RuleLocalService,
         rulesSetLocalService: RulesSetLocalService) {
        
        self.ruleLocalService = ruleLocalService
        self.rulesSetLocalService = rulesSetLocalService
    }
    
    // MARK: - ExerciseFacade
    
    func obtainRulesSet() -> [RulesSet] {
        return rulesSetLocalService.obtainRulesSet()
    }
    
    func obtainRules(forRulesSetId id: String) -> [Rule] {
        guard let rulesSet = rulesSetLocalService.obtainRulesSet(forId: id) else {
            return []
        }
        
        return rulesSet.progress.compactMap { $0.rule }
    }
    
    func setProgress(forRulesSetId id: String, ruleId: String, isCorrectAnswer: Bool) {
        guard
            let rulesSet = rulesSetLocalService.obtainRulesSet(forId: id),
            let progress = rulesSet.progress.first(where: { $0.rule?.id == ruleId }) else {
                return
        }
        
        rulesSetLocalService.update {
            if isCorrectAnswer {
                progress.progress = progress.progress + 1
            } else {
                progress.errorCount = progress.errorCount + 1
            }
        }
    }
}
