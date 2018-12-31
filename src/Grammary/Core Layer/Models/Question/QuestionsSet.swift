//
//  QuestionsSet.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation

struct QuestionsSet {
    var name: String
    var progress: [QuestionProgress]
}

struct QuestionProgress {
    var id: String
    var progress: Int = 0
    var errorCount: Int = 0
    var nextExerciseDate: Date?
    
    var percentOfProgress: Double {
        return Double(progress) / Double(QuestionsSetConstants.maxNumberOfExersice)
    }
}
