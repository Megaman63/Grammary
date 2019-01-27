//
//  RulesSetInfoState.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct RulesSetInfoState {
    let rulesSetId: String
    var sections: [CommonAnyTypeSection] = []
    
    init(rulesSetId: String) {
        self.rulesSetId = rulesSetId
    }
}
