//
//  AnswersAnimation.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/10/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import CoreGraphics

enum AnswersAnimationType: Equatable {
    case shouldDissappear
    case none
    case shouldChangeIndex(currentIndex: Int, newIndex: Int)
    
    // MARK: - Equtable
    
    static func == (lhs: AnswersAnimationType, rhs: AnswersAnimationType) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none), (.shouldDissappear, .shouldDissappear):
            return true
        case (.shouldChangeIndex(let lhsCurrent, let lhsNew), .shouldChangeIndex(let rhsCurrent, let rhsNew)):
            return lhsCurrent == rhsCurrent && lhsNew == rhsNew
        default:
            return false
        }
    }
}

struct AnswersAnimation {
    var animations: [AnswersAnimationType] = []
    
    mutating func calculateAnimations(animation: RuleAppearanceAnimation) {
        animations = []
        switch animation {
        case .correctAnswer(let correctIndex):
            for i in 0..<4 {
                if i < correctIndex {
                    animations.append(.shouldDissappear)
                } else if i == correctIndex {
                    animations.append(.shouldChangeIndex(currentIndex: correctIndex, newIndex: 0))
                } else {
                    animations.append(.none)
                }
            }
            
        case .wrongAnswer(let correctIndex, let wrongIndex):
            var firstFreeIndex = 0
            for i in 0..<4 {
                if i == correctIndex {
                    animations.append(.shouldChangeIndex(currentIndex: correctIndex, newIndex: firstFreeIndex))
                    firstFreeIndex += 1
                } else if i == wrongIndex {
                    animations.append(.shouldChangeIndex(currentIndex: wrongIndex, newIndex: firstFreeIndex))
                    firstFreeIndex += 1
                } else if i < correctIndex || i < wrongIndex {
                    animations.append(.shouldDissappear)
                } else {
                    animations.append(.none)
                }
            }
        }
    }
}
