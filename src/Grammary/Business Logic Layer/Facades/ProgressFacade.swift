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
        
        rulesSetLocalService.update(progresses) { progresses in
            if isCorrectAnswer {
                progresses.forEach { $0.progress = $0.progress + 1 }
            } else {
                progresses.forEach { $0.errorCount = $0.errorCount + 1 }
            }
        }
    }
    
    func resetAllProgresses() {
        let progresses = ruleProgressLocalService.getAllProgresses()
        
        rulesSetLocalService.update(progresses) { progresses in
            progresses.forEach { $0.progress = 0; $0.errorCount = 0 }
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

enum NextReviseRecommendedDateOffset {
    static let veryPoorly: Double = 1 * 24 * 60 * 60
    static let poorly: Double     = 2 * 24 * 60 * 60
    static let medium : Double    = 3 * 24 * 60 * 60
    static let good: Double       = 4 * 24 * 60 * 60
    static let veryGood: Double   = 5 * 24 * 60 * 60
    static let reliably: Double   = 6 * 24 * 60 * 60
}

enum RulesSetProgressCharacteristic {
    case veryPoorly
    case poorly
    case medium
    case good
    case veryGood
    case reliably
    
    init(totalProgress: Double) {
        assert(totalProgress >= 0)
        switch totalProgress {
        case 0..<0.2:
            self = .veryPoorly
        case 0.2..<0.4:
            self = .veryPoorly
        case 0.4..<0.6:
            self = .medium
        case 0.6..<0.8:
            self = .good
        case 0.8..<1:
            self = .veryGood
        default:
            self = .reliably
        }
    }
    
    func evaluateNextReviseRecommendedDate() -> Date {
        switch self {
        case .veryPoorly:
            return Date(timeIntervalSinceNow: NextReviseRecommendedDateOffset.veryPoorly)
        case .poorly:
            return Date(timeIntervalSinceNow: NextReviseRecommendedDateOffset.poorly)
        case .medium:
            return Date(timeIntervalSinceNow: NextReviseRecommendedDateOffset.medium)
        case .good:
            return Date(timeIntervalSinceNow: NextReviseRecommendedDateOffset.good)
        case .veryGood:
            return Date(timeIntervalSinceNow: NextReviseRecommendedDateOffset.veryGood)
        case .reliably:
            return Date(timeIntervalSinceNow: NextReviseRecommendedDateOffset.reliably)
        }
    }
}
