//
//  QuestionsSetsPresenter+QuestionsSetsInteractorOutput.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

extension QuestionsSetsPresenterImpl: QuestionsSetsInteractorOutput {

    // MARK: - QuestionsSetsInteractorOutput
    
    func didLoadQuestionsSets(_ sets: [QuestionsSet]) {
        let items = sets.map { set -> QuestionsSetItem in
            var sumOfProgresses = 0.0
            set.progress.forEach { sumOfProgresses = sumOfProgresses + $0.percentOfProgress }
            let totalProgress = sumOfProgresses / Double(set.progress.count)
            return QuestionsSetItem(name: set.name, totalProgress: totalProgress)
        }
        
        let section = CommonSection(items: items) { [weak router] _ in
            router?.dismissView()
        }
        
        state.sections = [section]
    }
}
