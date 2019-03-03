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
        
        let headerItem = RulesSetHeaderItem(
            title: rulesSet.name,
            description: rulesSet.setDescription,
            totalProgress: totalProgress,
            reviseRecommendation: ReviseRecommendation(reviseRecommendationDate: rulesSet.nextReviseRecommendedDate)
        )
        view?.configure(headerItem: headerItem)
        
        let ruleItems: [RuleProgressItem] = rulesSet
            .progress
            .enumerated()
            .map { (index, progress) -> RuleProgressItem in
                RuleProgressItem(name: progress.rule?.ruleDescription ?? "",
                                 errorCount: progress.errorCount,
                                 correctAnswers: progress.progress,
                                 index: index)
        }
        
        let items: [CollectionViewItem] = ruleItems
        state.sections = [CommonAnyTypeCollectionViewSection(items: items, didSelectItem: nil)]
        view?.set(dataSource: state.sections)
    }
}
