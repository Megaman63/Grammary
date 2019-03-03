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
    private let accountFacade: AccountFacade
    
    // MARK: - Init
    
    init(exerciseFacade: ExerciseFacade,
         progressFacade: ProgressFacade,
         accountFacade: AccountFacade) {
        
        self.exerciseFacade = exerciseFacade
        self.progressFacade = progressFacade
        self.accountFacade = accountFacade
    }
    
    // MARK: - ExerciseInteractor
    
    func loadRules(forSetWithId id: String) {
        DispatchQueue.main.async { [weak self] in
            let progress = self?.exerciseFacade.obtainProgresses(forRulesSetId: id) ?? []
            self?.output?.didLoad(progress: progress)
        }
    }
    
    func setProgress(questionId: String, isCorrectAnswer: Bool) {
        progressFacade.setProgress(questionId: questionId, isCorrectAnswer: isCorrectAnswer)
    }
    
    func finishExercies(ruleSetId: String) {
        progressFacade.setNewNextReviseRecommendedDate(forRulesSetId: ruleSetId)
    }
    
    func addTimeSpentOnExersice(time: Double) {
        accountFacade.addTimeSpentOnExersice(time: time)
    }
}
