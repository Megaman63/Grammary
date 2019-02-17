//
//  ExerciseFacade.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

protocol ExerciseFacade: AnyObject {
    func obtainQuestion(withId id: String) -> Question?
    func obtainRulesSet() -> [RulesSet]
    func obtainProgresses(forRulesSetId id: String) -> [RuleProgress]
    func obtainRules(forRulesSetId id: String) -> [Rule]
    func excludeRuleFromRulesSet(whichHasQuestionWithId questionId: String)
}

final class ExerciseFacadeImpl: ExerciseFacade {
    
    // MARK: - Private properties
    
    private let ruleLocalService: RuleLocalService
    private let rulesSetLocalService: RulesSetLocalService
    private let questionLocalService: QuestionLocalService
    private let ruleProgressLocalService: RuleProgressLocalService
    
    // MARK: - Init
    
    init(ruleLocalService: RuleLocalService,
         rulesSetLocalService: RulesSetLocalService,
         questionLocalService: QuestionLocalService,
         ruleProgressLocalService: RuleProgressLocalService) {
        
        self.ruleLocalService = ruleLocalService
        self.rulesSetLocalService = rulesSetLocalService
        self.questionLocalService = questionLocalService
        self.ruleProgressLocalService = ruleProgressLocalService
    }
    
    // MARK: - ExerciseFacade
    
    func obtainRulesSet() -> [RulesSet] {
        return rulesSetLocalService.obtainRulesSet()
    }
    
    func obtainQuestion(withId id: String) -> Question? {
        return questionLocalService.obtainQuestiont(withId: id)
    }
    
    func obtainProgresses(forRulesSetId id: String) -> [RuleProgress] {
        guard let rulesSet = rulesSetLocalService.obtainRulesSet(forId: id) else {
            return []
        }
        
        return rulesSet.progress.map { $0 }
    }
    
    func obtainRules(forRulesSetId id: String) -> [Rule] {
        guard let rulesSet = rulesSetLocalService.obtainRulesSet(forId: id) else {
            return []
        }
        
        return rulesSet.progress.compactMap { $0.rule }
    }
    
    func excludeRuleFromRulesSet(whichHasQuestionWithId questionId: String) {
        let progresses = ruleProgressLocalService.getAllProgressesFor(questionId: questionId)
        do {
            try ruleProgressLocalService.delete(progresses: progresses)
        } catch {
            printError(error)
        }
    }
}
