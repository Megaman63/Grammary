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
    private let progressFacade: ProgressFacade
    
    // MARK: - Init
    
    init(exerciseFacade: ExerciseFacade,
         progressFacade: ProgressFacade) {
        self.exerciseFacade = exerciseFacade
        self.progressFacade = progressFacade
    }
    
    // MARK: - ExerciseInteractor
    
    func loadRules(forSetWithId id: String) {
        let rules = exerciseFacade.obtainRules(forRulesSetId: id)
        output?.didLoad(rules: rules)
    }
    
    func setProgress(questionId: String, isCorrectAnswer: Bool) {
        progressFacade.setProgress(questionId: questionId, isCorrectAnswer: isCorrectAnswer)
    }
}
