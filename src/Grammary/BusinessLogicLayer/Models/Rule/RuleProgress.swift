//
//  RuleProgress.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation
import RealmSwift

class RuleProgress: Object {
    override static func primaryKey() -> String? { return "id" }
    
    @objc dynamic var id: String = UUID().uuidString
    
    @objc dynamic var rule: Rule?
    @objc dynamic var progress: Int = 0
    @objc dynamic var errorCount: Int = 0
    @objc dynamic var reliableProgress: Int = 0
    @objc dynamic var nextExerciseDate: Date?
    
    var percentOfProgress: Double {
        return Double(progress) / Double(reliableProgress)
    }
    
    convenience init(rule: Rule?, reliableProgress: Int) {
        self.init()
        
        self.rule = rule
        self.reliableProgress = reliableProgress
    }
}
