//
//  RulesSetsPresenter.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetsPresenterImpl: RulesSetsPresenter {

    weak var view: RulesSetsView?
    var interactor: RulesSetsInteractor
    let router: RulesSetsRouter

    // MARK: - State

    var state: RulesSetsState

    // MARK: - Init

    init(view: RulesSetsView,
         interactor: RulesSetsInteractor,
         router: RulesSetsRouter,
         state: RulesSetsState) {

        self.view = view
        self.interactor = interactor
        self.router = router
        self.state = state
    }

    // MARK: - RulesSetsPresenter
    
    func didTriggerViewReadyEvent() {
        interactor.subscribeOnAllRulesSets()
    }
    
    func didChangeSearchText(_ searchText: String) {
        state.searchText = searchText
        buildSections()
    }
    
    func didSelectFilterAtIndex(_ index: Int) {
        guard let selectedFilter = RulesFilter(rawValue: index) else {
            assertionFailure("Unknown filter selected")
            return
        }
        
        state.selectedFilter = selectedFilter
        buildSections()
    }
    
    // MARK: - Public functions
    
    func buildSections() {
        let items: [RulesSetItem] = state.sets
            .filterBy(ruleFilter: state.selectedFilter)
            .filterBy(searchText: state.searchText)
            .enumerated()
            .map { (index, set) -> RulesSetItem in
                return RulesSetItem(id: set.id,
                                    name: set.name,
                                    sibtitle: set.sibtitle,
                                    totalProgress: set.totalProgress,
                                    index: index,
                                    searchText: state.searchText)
        }
        
        let section = CommonCollectionViewSection(items: items) { [weak self] index in
            guard let self = self else {
                return
            }
            self.router.showRulesSetInfo(rulesSetId: self.state.sets[index].id)
        }
        
        state.sections = [section]
        view?.set(dataSource: state.sections)
    }
}

fileprivate extension Array where Element == RulesSet {
    
    func filterBy(ruleFilter: RulesFilter) -> [RulesSet] {
        return filter { set -> Bool in
            switch ruleFilter {
            case .all:
                return true
            case .learning:
                return set.totalProgress > 0
            case .notLearning:
                return set.totalProgress == 0
            }
        }
    }
    
    func filterBy(searchText: String) -> [RulesSet] {
        if searchText.isEmpty {
            return self
        }
        return filter { set -> Bool in
            return set.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}
