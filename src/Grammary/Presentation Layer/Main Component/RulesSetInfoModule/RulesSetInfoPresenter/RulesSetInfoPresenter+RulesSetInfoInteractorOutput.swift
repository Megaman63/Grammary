//
//  RulesSetInfoPresenter+RulesSetInfoInteractorOutput.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

extension RulesSetInfoPresenterImpl: RulesSetInfoInteractorOutput {

    // MARK: - RulesSetInfoInteractorOutput

    func didChangeRulesSet(changes: PrimaryKeyObserverNotification<RulesSet>) {
        switch changes {
        case .deleted:
            router.dismissView()
        case .error(let error):
            printError(error)
        case .initial(let rulesSet), .updated(let rulesSet):
            buildSection(forRulesSet: rulesSet)
        }
    }
    
    // MARK: - Private functions
    
    private func buildSection(forRulesSet rulesSet: RulesSet) {
        state.sections = []
        
        var totalProgress = 0.0
        rulesSet.progress.forEach { totalProgress = totalProgress + $0.percentOfProgress }
        totalProgress = totalProgress / Double(rulesSet.progress.count)
        
        let rulesSetId = rulesSet.id
        let headerItem = RulesSetHeaderItem(
            name: rulesSet.name,
            totalProgress: totalProgress,
            nextReviseRecommendedDateString: "\(rulesSet.nextReviseRecommendedDate)"
        ) { [weak router] in
            router?.showExercise(rulesSetId: rulesSetId)
        }
        
        let ruleItems: [RuleProgressItem] = rulesSet.progress.map {
            RuleProgressItem(name: $0.rule?.ruleDescription ?? "",
                             errorCount: $0.errorCount,
                             correctAnswers: $0.progress)
        }
        
        let items: [TableViewItem] = [headerItem] + ruleItems
        state.sections = [CommonAnyTypeSection(items: items, didSelectItem: nil)]
        view?.setDataSource(state.sections)
    }
}
