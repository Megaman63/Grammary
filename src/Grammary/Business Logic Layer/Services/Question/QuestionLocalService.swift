//
//  QuestionLocalService.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol QuestionLocalService {
    func obtainQuestiont(withId id: String) -> Question?
    
    func update(_ object: Question, _ block: ((Question) -> Void)?)
    func update(_ objects: [Question], _ block: (([Question]) -> Void)?)
}

final class QuestionLocalServiceImpl: QuestionLocalService, PersistenceService {
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - QuestionLocalService

    func obtainQuestiont(withId id: String) -> Question? {
        return getRealm().object(ofType: RealmObject.self, forPrimaryKey: id)
    }
    
    // MARK: - PersistenceService
    
    typealias RealmObject = Question
}
