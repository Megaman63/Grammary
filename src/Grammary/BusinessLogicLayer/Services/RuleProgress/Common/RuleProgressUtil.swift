//
//  RuleProgressUtil.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

enum NextReviseRecommendedDateOffset {
    static let veryPoorly: Double = 1 * 24 * 60 * 60
    static let poorly: Double     = 2 * 24 * 60 * 60
    static let medium : Double    = 3 * 24 * 60 * 60
    static let good: Double       = 4 * 24 * 60 * 60
    static let veryGood: Double   = 5 * 24 * 60 * 60
    static let reliably: Double   = 6 * 24 * 60 * 60
}

enum RulesSetProgressCharacteristic {
    case notStartedYet
    case veryPoorly
    case poorly
    case medium
    case good
    case veryGood
    case reliably
    
    init(totalProgress: Double) {
        assert(totalProgress >= 0)
        switch totalProgress {
        case 0:
            self = .notStartedYet
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
    
    func evaluateNextReviseRecommendedDate() -> Date? {
        switch self {
        case .notStartedYet:
            return nil
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
