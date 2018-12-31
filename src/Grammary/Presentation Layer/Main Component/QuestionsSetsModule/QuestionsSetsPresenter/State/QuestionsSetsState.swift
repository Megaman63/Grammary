//
//  QuestionsSetsState.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct QuestionsSetItem {
    var name: String
    var totalProgress: Int
    var onTap: (()->Void)?
}

struct QuestionsSetsState {
    var sets: [QuestionsSet]
    var items: [QuestionsSetItem]
}
