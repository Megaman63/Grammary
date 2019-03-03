//
//  Account.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class Account: Object {

    @objc dynamic var name: String = ""
    @objc dynamic var installationDate: Date = Date().addingTimeInterval(-60 * 60 * 24 * 5)
    @objc dynamic var timeSpentInApplication: Double = 0
    @objc dynamic var countOfExercisesInWeek: Int = 5
    @objc dynamic var countOfQuestionInExercise: Int = 15

}

