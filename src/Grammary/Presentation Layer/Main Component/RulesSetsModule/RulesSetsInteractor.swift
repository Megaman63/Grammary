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
    
    // MARK: - Init
    
    init(exerciseFacade: ExerciseFacade) {
        self.exerciseFacade = exerciseFacade
    }
    // MARK: - RulesSetsInteractor
    
    func requestRulesSets() {
        let rulesSets = exerciseFacade.obtainRulesSet()
        output?.didLoadRulesSets(rulesSets)
    }
    
}
