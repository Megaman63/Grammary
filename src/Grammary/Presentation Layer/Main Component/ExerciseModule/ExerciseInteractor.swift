//
//  ExerciseInteractor.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExerciseInteractorImpl: ExerciseInteractor {

    weak var output: ExerciseInteractorOutput?
    
    // MARK: - Private properties
    
    private let exerciseFacade: ExerciseFacade
    
    // MARK: - Init
    
    init(exerciseFacade: ExerciseFacade) {
        self.exerciseFacade = exerciseFacade
    }
    
    // MARK: - ExerciseInteractor
    
    func loadRules(forSetWithId id: String) {
        let rules = exerciseFacade.obtainRules(forRulesSetId: id)
        output?.didLoad(rules: rules)
    }
    
    func setProgress(forRulesSetId id: String, ruleId: String, isCorrectAnswer: Bool) {
        exerciseFacade.setProgress(forRulesSetId: id, ruleId: ruleId, isCorrectAnswer: isCorrectAnswer)
    }
}
