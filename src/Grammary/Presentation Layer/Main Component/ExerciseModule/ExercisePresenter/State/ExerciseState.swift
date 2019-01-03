//
//  ExerciseState.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

enum RuleAppearanceAnimation {
    case wrongAnswer(correctIndex: Int, wrongIndex: Int)
    case correctAnswer(correctIndex: Int)
}

struct ExerciseState {
    let rulesSetId: String
    
    var currentRuleIndex = 0
    var rules: [Rule] = []
    
    var currentRule: Rule? {
        guard currentRuleIndex < rules.count else {
            return nil
        }
        
        return rules[currentRuleIndex]
    }
    
    init(rulesSetId: String) {
        self.rulesSetId = rulesSetId
    }
}
