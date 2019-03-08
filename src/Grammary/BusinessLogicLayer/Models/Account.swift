//
//  Account.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

enum AccountConstants {
    static let minCountOfExercisesInWeek = 1
    static let maxCountOfExercisesInWeek = 15
    
    static let minCountOfQuestionInExercise = 5
    static let maxCountOfQuestionInExercise = 45
}

class Account: Object {

    override static func primaryKey() -> String? { return "id" }
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var installationDate: Date = Date().addingTimeInterval(-60 * 60 * 24 * 5)
    @objc dynamic var timeSpentInApplication: Double = 0
    @objc dynamic var countOfExercisesInWeek: Int = 5
    @objc dynamic var countOfQuestionInExercise: Int = 15
    @objc dynamic var notificationIsOn: Bool = false
}

