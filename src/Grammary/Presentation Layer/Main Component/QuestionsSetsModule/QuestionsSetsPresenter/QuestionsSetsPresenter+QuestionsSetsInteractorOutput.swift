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
            return QuestionsSetItem(id: set.id, name: set.name, totalProgress: totalProgress)
        }
        
        let section = CommonSection(items: items) { [weak self] index in
            guard let item = self?.state.sections.first?.items[index] as? QuestionsSetItem else {
                return
            }
            
            self?.router.showExercise(questionsSetId: item.id)
        }
        
        state.sections = [section]
        view?.setDataSource(state.sections)
    }
}
