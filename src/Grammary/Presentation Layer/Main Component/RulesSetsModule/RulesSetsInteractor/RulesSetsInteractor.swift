//
//  RulesSetsInteractor.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetsInteractorImpl: RulesSetsInteractor {

    weak var output: RulesSetsInteractorOutput?

    // MARK: - Private functions
    
    private let exerciseFacade: ExerciseFacade
    private let rulesSetNotificationCenter: RulesSetNotificationCenter
    // MARK: - Init
    
    init(exerciseFacade: ExerciseFacade,
         rulesSetNotificationCenter: RulesSetNotificationCenter) {
        
        self.exerciseFacade = exerciseFacade
        self.rulesSetNotificationCenter = rulesSetNotificationCenter
    }
    
    // MARK: - RulesSetsInteractor
    
    func subscribeOnAllRulesSets() {
        rulesSetNotificationCenter.subscribeOnAllRulesSets(subscriber: self)
    }
    
}
