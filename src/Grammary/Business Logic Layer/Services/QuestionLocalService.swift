//
//  QuestionLocalService.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol QuestionLocalService: AnyObject {
    func obtainQuestions(ids: [String]) -> [Question]
    func update(questionsSet: QuestionsSet)
}

final class QuestionLocalServiceImpl: PersistenceService, QuestionLocalService {
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - QuestionLocalService
 
    func obtainQuestions(ids: [String]) -> [Question] {
        let predicate = NSPredicate(format: "\(#keyPath(Question.id)) IN %@", ids)
        return
            getRealm()
                .objects(Question.self)
                .filter(predicate)
                .toArray()
                .shuffled()
    }
    
    func update(questionsSet: QuestionsSet) {
        let realm = getRealm()
        try? realm.write {
            realm.add(questionsSet, update: true)
        }
    }
}
