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
    private let ruleProgressLocalService: RuleProgressLocalService
    
    // MARK: - Init
    
    init(ruleLocalService: RuleLocalService,
         rulesSetLocalService: RulesSetLocalService,
         ruleProgressLocalService: RuleProgressLocalService) {
        self.ruleLocalService = ruleLocalService
        self.rulesSetLocalService = rulesSetLocalService
        self.ruleProgressLocalService = ruleProgressLocalService
    }
    
    // MARK: - UpdatesFacade
    
    func updateQuestionAndAddRulesSetsIfNeeded() {
        var sets = getGerundRulesSet()
        sets += getArticleRulesSet()
        sets += getConditionalRulesSet()
        sets += getArticleRulesSet()
        sets += getPlacePrepositionsRulesSet()
        sets += getTimePrepositionsRulesSet()
        sets += getPresentTensesRulesSet()
        sets += getPastTensesRulesSet()
        sets += getFutureTensesRulesSet()
        
        for set in sets {
            if let existedRuleSet = rulesSetLocalService.obtainRulesSet(forId: set.id) {
                set.nextReviseRecommendedDate = existedRuleSet.nextReviseRecommendedDate
            } else {
                let characteristic = RulesSetProgressCharacteristic(totalProgress: set.totalProgress)
                set.nextReviseRecommendedDate = characteristic.evaluateNextReviseRecommendedDate()
            }
        }
        rulesSetLocalService.update(sets, nil)
    }
    
    // MARK: - Private functions
    
    private func getProgress(forRule rule: Rule, reliableProgress: Int) -> RuleProgress {
        if let progress = ruleProgressLocalService.getProgress(forRule: rule) {
            return progress
        } else {
            let progress = RuleProgress(rule: rule, reliableProgress: reliableProgress)
            ruleProgressLocalService.update(progress, nil)
            return progress
        }
    }
    
    // MARK: - Get rules sets
    
    private func getGerundRulesSet() -> [RulesSet] {
        let gerundRules = parseGerund().shuffled()
        var gerundSets: [RulesSet] = []
        let partCount = gerundRules.count / 10
        for i in 0..<partCount {
            let lastIndex = i * 10 + 10 < gerundRules.count ? i * 10 + 10 :  gerundRules.count
            let progress = gerundRules[i * 10..<lastIndex].map { getProgress(forRule: $0, reliableProgress: 6) }
            gerundSets.append(RulesSet(id: "\(i)",
                name: "Gerund or Infinitive",
                sibtitle: "Part \(i+1)",
                setDescription: "В предложении герундий и инфинитив часто могут выполнять одну и ту же функцию, поэтому иногда бывает трудно решить, где нужно использовать герундий, а где – инфинитив.",
                progress: progress.toRealmList()))
        }
        return gerundSets
    }
    
    private func getConditionalRulesSet() -> [RulesSet] {
        let contitionalRules = parseConditional()
        let conditionalProgress = contitionalRules.map { getProgress(forRule: $0, reliableProgress: 15) }
        let conditionalSet = RulesSet(id: "c-1",
                                      name: "Conditional clauses",
                                      sibtitle: "",
                                      setDescription: "",
                                      progress: conditionalProgress.toRealmList())
        return [conditionalSet]
    }
    
    private func getArticleRulesSet() -> [RulesSet] {
        let articleRules = parseArticles()
        let articlesProgress = articleRules.map { getProgress(forRule: $0, reliableProgress: 15) }
        let articlesSet = RulesSet(id: "a-1",
                                   name: "Articles",
                                   sibtitle: "",
                                   setDescription: "",
                                   progress: articlesProgress.toRealmList())
        return [articlesSet]
    }
    
    private func getTimePrepositionsRulesSet() -> [RulesSet] {
        let timePrepositionsRules = parseTimePrepositions()
        let timePrepositionsProgress = timePrepositionsRules.map { getProgress(forRule: $0, reliableProgress: 15) }
        let timePrepositionsSet = RulesSet(id: "p-t-0",
                                           name: "Prepositions of time",
                                           sibtitle: "",
                                           setDescription: "",
                                           progress: timePrepositionsProgress.toRealmList())
        return [timePrepositionsSet]
    }
    
    private func getPlacePrepositionsRulesSet() -> [RulesSet] {
        let placePrepositionsRules = parsePlacePrepositions()
        let placePrepositionsProgress = placePrepositionsRules.map { getProgress(forRule: $0, reliableProgress: 15) }
        let placePrepositionsSet = RulesSet(id: "p-p-0",
                                           name: "Prepositions of place",
                                           sibtitle: "",
                                           setDescription: "",
                                           progress: placePrepositionsProgress.toRealmList())
        return [placePrepositionsSet]
    }
    
    private func getPresentTensesRulesSet() -> [RulesSet] {
        let rules = parsePresentSimple() + parsePresentPerfect()
        let progress = rules.map { getProgress(forRule: $0, reliableProgress: 15) }
        let set = RulesSet(id: "PresentTenses",
                           name: "Present tenses",
                           sibtitle: "",
                           setDescription: "",
                           progress: progress.toRealmList())
        return [set]
    }
    
    private func getPastTensesRulesSet() -> [RulesSet] {
        let rules = parsePastSimple() + parsePastPerfect() + parsePastContinuous()
        let progress = rules.map { getProgress(forRule: $0, reliableProgress: 15) }
        let set = RulesSet(id: "PastTenses",
                           name: "Past tenses",
                           sibtitle: "",
                           setDescription: "",
                           progress: progress.toRealmList())
        return [set]
    }
    
    private func getFutureTensesRulesSet() -> [RulesSet] {
        let rules = parseFuturePerfect()
        let progress = rules.map { getProgress(forRule: $0, reliableProgress: 15) }
        let set = RulesSet(id: "FutureTenses",
                           name: "Future tenses",
                           sibtitle: "",
                           setDescription: "",
                           progress: progress.toRealmList())
        return [set]
    }
}
