//
//  QuestionProgress.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class QuestionProgress: Object {
    override static func primaryKey() -> String? { return "id" }
    
    @objc dynamic var id: String = UUID().uuidString
    
    @objc dynamic var question: Question?
    @objc dynamic var progress: Int = 0
    @objc dynamic var errorCount: Int = 0
    @objc dynamic var nextExerciseDate: Date?
    
    var percentOfProgress: Double {
        return Double(progress) / Double(QuestionsSetConstants.maxNumberOfExersice)
    }
    
    convenience init(question: Question?) {
        self.init()
        
        self.question = question
    }
}
