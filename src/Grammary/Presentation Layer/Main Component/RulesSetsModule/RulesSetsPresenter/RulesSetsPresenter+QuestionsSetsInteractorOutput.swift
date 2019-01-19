//
//  RulesSetsPresenter+RulesSetsInteractorOutput.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

extension RulesSetsPresenterImpl: RulesSetsInteractorOutput {
    
    // MARK: - RulesSetsInteractorOutput
    
    func didChangeRulesSets(changes: RulesSetNotification) {
        switch changes {
        case .error(let error):
            printError(error)
        case .initial(let sets), .update(let sets, _, _, _):
             let items: [RulesSetItem] = sets.map { set -> RulesSetItem in
                var sumOfProgresses = 0.0
                set.progress.forEach { sumOfProgresses = sumOfProgresses + $0.percentOfProgress }
                let totalProgress = sumOfProgresses / Double(set.progress.count)
                return RulesSetItem(id: set.id, name: set.name, totalProgress: totalProgress)
            }
            let section = CommonSection(items: items) { [weak router] index in
                router?.showRulesSetInfo(rulesSet: sets[index])
            }
            
            state.sections = [section]
            view?.setDataSource(state.sections)
        }
    }
}