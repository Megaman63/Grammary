//
//  ExampleState.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct ExampleState {
    var rulesSetId: String
    var examples: [RuleExample] = []
    var sections: [CommonAnyTypeSection] = []
    var currentQuestion: Question?
    
    init(rulesSetId: String) {
        self.rulesSetId = rulesSetId
    }
}
