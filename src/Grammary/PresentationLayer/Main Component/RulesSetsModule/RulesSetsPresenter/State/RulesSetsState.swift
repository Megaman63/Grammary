//
//  RulesSetsState.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation

enum RulesFilter: Int {
    case all = 0
    case learning
    case notLearning
}

struct RulesSetsState {
    var sets: [RulesSet] = []
    var sections: [CommonCollectionViewSection<RulesSetItem>] = []
    var selectedFilter: RulesFilter = .all
    var searchText = ""
}
