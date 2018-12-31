//
//  QuestionsSetsState.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct QuestionsSetItem: TableViewItem {
    var name: String
    var totalProgress: Double
    
    // MARK: - TableViewItem
    
    static let cellClass: UITableViewCell.Type = QuestionsSetTableViewCell.self
}

struct QuestionsSetsState {
    var sections: [CommonSection<QuestionsSetItem>] = []
}
