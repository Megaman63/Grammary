//
//  ExampleInteractor.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExampleInteractorImpl: ExampleInteractor {

    weak var output: ExampleInteractorOutput?
    private let progressFacade: ProgressFacade
    private let exerciseFacade: ExerciseFacade
    
    // MARK: - Init
    
    init(progressFacade: ProgressFacade,
         exerciseFacade: ExerciseFacade) {
        self.progressFacade = progressFacade
        self.exerciseFacade = exerciseFacade
    }
    
    // MARK: - ExampleInteractor
    
    func obtainQuestion(withId id: String) -> Question? {
        return exerciseFacade.obtainQuestion(withId: id)
    }
    
    func obtainProgresses(forRulesSetId id: String) -> [RuleProgress] {
        return exerciseFacade.obtainProgresses(forRulesSetId: id)
    }
    
    func excludeRuleFromRulesSet(whichHasQuestionWithId questionId: String) {
        exerciseFacade.excludeRuleFromRulesSet(whichHasQuestionWithId: questionId)
    }
    
    func resetProgress(forQuestionId questionId: String) {
        progressFacade.resetProgress(forQuestionId: questionId)
    }
    
    func setMaximumProgress(forQuestionId questionId: String) {
        progressFacade.setMaximumProgress(forQuestionId: questionId)
    }
    
    func reportError(questionId: String) {
        print("reportError questionId \(questionId)")
    }
}
