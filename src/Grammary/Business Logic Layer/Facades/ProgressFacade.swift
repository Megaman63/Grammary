//
//  ProgressFacade.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol ProgressFacade: AnyObject {
    func setProgress(questionId: String, isCorrectAnswer: Bool)
    func resetAllProgresses()
    func resetProgress(forQuestionId questionId: String)
    func setMaximumProgress(forQuestionId questionId: String)
    func setNewNextReviseRecommendedDate(forRulesSetId id: String)
}

final class ProgressFacadeImpl: ProgressFacade {
    
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
    
    // MARK: - ProgressFacade
    
    func setProgress(questionId: String, isCorrectAnswer: Bool)  {
        let progresses = ruleProgressLocalService.getAllProgressesFor(questionId: questionId)
        
        ruleProgressLocalService.update(progresses) { progresses in
            if isCorrectAnswer {
                progresses.forEach { $0.progress = $0.progress + 1 }
            } else {
                progresses.forEach { $0.errorCount = $0.errorCount + 1 }
            }
        }
    }
    
    func resetAllProgresses() {
        let progresses = ruleProgressLocalService.getAllProgresses()
        ruleProgressLocalService.update(progresses) { progresses in
            progresses.forEach { $0.progress = 0; $0.errorCount = 0 }
        }
    }
    
    func resetProgress(forQuestionId questionId: String) {
        let progresses = ruleProgressLocalService.getAllProgressesFor(questionId: questionId)
        
        ruleProgressLocalService.update(progresses) { progresses in
            progresses.forEach { $0.progress = 0 }
        }
    }
    
    func setMaximumProgress(forQuestionId questionId: String) {
        let progresses = ruleProgressLocalService.getAllProgressesFor(questionId: questionId)
        
        ruleProgressLocalService.update(progresses) { progresses in
            progresses.forEach { $0.progress = $0.reliableProgress }
        }
    }
    
    func setNewNextReviseRecommendedDate(forRulesSetId id: String) {
        guard let rulesSet = rulesSetLocalService.obtainRulesSet(forId: id) else {
            return
        }
        let characteristic = RulesSetProgressCharacteristic(totalProgress: rulesSet.totalProgress)
        rulesSetLocalService.update(rulesSet) { rulesSet in
            rulesSet.nextReviseRecommendedDate = characteristic.evaluateNextReviseRecommendedDate()
        }
    }
}
