//
//  QuestionsSetLocalService.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol QuestionsSetLocalService: AnyObject {
    func obtainQuestionsSet(forId id: String) -> QuestionsSet?
    func obtainQuestionsSet() -> [QuestionsSet]
}

final class QuestionsSetLocalServiceImpl: PersistenceService, QuestionsSetLocalService {
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - QuestionsSetLocalService
    
    func obtainQuestionsSet(forId id: String) -> QuestionsSet? {
        return getRealm().object(ofType: QuestionsSet.self, forPrimaryKey: id)
    }
    
    func obtainQuestionsSet() -> [QuestionsSet] {
        return
            getRealm()
                .objects(QuestionsSet.self)
                .toArray()
    }
}
