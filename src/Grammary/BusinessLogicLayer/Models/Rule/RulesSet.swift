//
//  RulesSet.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class RulesSet: Object {
    override static func primaryKey() -> String? { return "id" }
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var sibtitle: String = ""
    @objc dynamic var setDescription: String = ""
    @objc dynamic var nextReviseRecommendedDate: Date?
    
    var progress = List<RuleProgress>()
    
    var totalProgress: Double {
        var sumOfProgresses = 0.0
        progress.forEach { sumOfProgresses = sumOfProgresses + $0.percentOfProgress }
        return sumOfProgresses / Double(progress.count)
    }
    
    convenience init(id: String,
                     name: String,
                     sibtitle: String,
                     setDescription: String,
                     progress: List<RuleProgress>) {
        self.init()
        
        self.id = id
        self.name = name
        self.sibtitle = sibtitle
        self.setDescription = setDescription
        self.progress = progress
    }
}
