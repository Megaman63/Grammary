//
//  ExerciseFacade.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

protocol ExerciseFacade: AnyObject {
    func obtainQuestionsSet() -> [QuestionsSet]
    func obtainQuestions(forQuestionsSetId id: String) -> [Question]
}

final class ExerciseFacadeImpl: ExerciseFacade {
    
    // MARK: - Private properties
    
    private let questionLocalService: QuestionLocalService
    private let questionsSetLocalService: QuestionsSetLocalService
    
    // MARK: - Init
    
    init(questionLocalService: QuestionLocalService,
         questionsSetLocalService: QuestionsSetLocalService) {
        
        self.questionLocalService = questionLocalService
        self.questionsSetLocalService = questionsSetLocalService
    }
    
    // MARK: - ExerciseFacade
    
    func obtainQuestionsSet() -> [QuestionsSet] {
        return questionsSetLocalService.obtainQuestionsSet()
    }
    
    func obtainQuestions(forQuestionsSetId id: String) -> [Question] {
        guard let questionsSet = questionsSetLocalService.obtainQuestionsSet(forId: id) else {
            return []
        }
        
        return questionsSet.progress.compactMap { $0.question }
    }
}
