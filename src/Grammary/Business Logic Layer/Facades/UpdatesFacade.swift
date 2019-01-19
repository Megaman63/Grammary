//
//  UpdatesFacade.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

protocol UpdatesFacade: AnyObject {
    func updateQuestionAndAddRulesSetsIfNeeded()
}

final class UpdatesFacadeImpl: UpdatesFacade {
    
    // MARK: - Private properties
    
    private let ruleLocalService: RuleLocalService
    private let rulesSetLocalService: RulesSetLocalService
    
    // MARK: - Init
    
    init(ruleLocalService: RuleLocalService,
         rulesSetLocalService: RulesSetLocalService) {
        self.ruleLocalService = ruleLocalService
        self.rulesSetLocalService = rulesSetLocalService
    }
    
    // MARK: - UpdatesFacade
    
    func updateQuestionAndAddRulesSetsIfNeeded() {
        
        let gerundRules = parseGerund().shuffled()
        let contitionalRules = parseConditional()
        let articleRules = parseArticles()
        
        let rules = gerundRules + contitionalRules + articleRules
        ruleLocalService.update(rules)
        
        guard rulesSetLocalService.obtainRulesSet().isEmpty else {
            return
        }
        
        var gerundSets: [RulesSet] = []
        let partCount = gerundRules.count / 10
        for i in 0..<partCount {
            let lastIndex = i * 10 + 10 < gerundRules.count ? i * 10 + 10 :  gerundRules.count
            let progress = gerundRules[i * 10..<lastIndex].map { RuleProgress(rule: $0, reliableProgress: 6) }
            gerundSets.append(RulesSet(id: "\(i)",
                name: "Gerund or Infinitive. Part \(i+1)",
                progress: progress.toRealmList()))
        }
        
        let conditionalProgress = contitionalRules.map { RuleProgress(rule: $0, reliableProgress: 15)}
        let conditionalSet = RulesSet(id: "c-1",
                                      name: "Conditional clauses",
                                      progress: conditionalProgress.toRealmList())
        
        let articlesProgress = articleRules.map { RuleProgress(rule: $0, reliableProgress: 15)}
        let articlesSet = RulesSet(id: "a-1",
                                   name: "Articles",
                                   progress: articlesProgress.toRealmList())
        
        rulesSetLocalService.update(gerundSets + [conditionalSet, articlesSet])
    }
}
