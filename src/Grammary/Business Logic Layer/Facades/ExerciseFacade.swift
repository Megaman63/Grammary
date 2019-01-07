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
    func setProgress(questionId: String, isCorrectAnswer: Bool)
}

final class ExerciseFacadeImpl: ExerciseFacade {
    
    // MARK: - Private properties
    
    private let ruleLocalService: RuleLocalService
    private let rulesSetLocalService: RulesSetLocalService
    private let ruleProgressLocalService: RuleProgressLocalService
    
    // MARK: - Init
    
    init(ruleLocalService: RuleLocalService,
         rulesSetLocalService: RulesSetLocalService,
         ruleProgressLocalService: RuleProgressLocalService) {
        
        self.ruleLocalService = ruleLocalService
        self.rulesSetLocalService = rulesSetLocalService
        self.ruleProgressLocalService = ruleProgressLocalService
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
    
    func setProgress(questionId: String, isCorrectAnswer: Bool)  {
        let progresses = ruleProgressLocalService.getAllProgressesFor(questionId: questionId)
        
        rulesSetLocalService.update {
            if isCorrectAnswer {
                progresses.forEach { $0.progress = $0.progress + 1 }
            } else {
                progresses.forEach { $0.errorCount = $0.errorCount + 1 }
            }
        }
    }
}
