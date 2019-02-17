//
//  ExamplePresenter.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExamplePresenterImpl: ExamplePresenter, ExampleModuleInput {

    weak var view: ExampleView?
    weak var moduleOutput: ExampleModuleOutput?
    var interactor: ExampleInteractor

    // MARK: - State

    var state: ExampleState

    // MARK: - Init

    init(view: ExampleView,
         interactor: ExampleInteractor,
         moduleOutput: ExampleModuleOutput,
         state: ExampleState) {

        self.view = view
        self.interactor = interactor
        self.moduleOutput = moduleOutput
        self.state = state
    }

    // MARK: - ExamplePresenter
    
    func didTapNextButton() {
        moduleOutput?.didTapNextButton()
    }
    
    // MARK: - ExampleModuleInput
    
    func set(currentQuestionId: String, partialRevealDrawerHeight: CGFloat) {
        state.currentQuestion = interactor.obtainQuestion(withId: currentQuestionId)
        buildSection()
        view?.set(partialRevealDrawerHeight: partialRevealDrawerHeight)
    }
    
    // MARK: - Private functions
    
    private func buildSection() {
        guard let question = state.currentQuestion else {
            assertionFailure()
            return
        }
        
        state.examples = question.examples.map { $0 }
        let header = ExampleHeaderItem(caption: "Примеры использования")
        let exampleItems: [TableViewItem] = state.examples.map { ExampleItem(text: $0.text ) }
        
        var buttonItems: [TableViewItem] = []
        
        
        let progresses = interactor.obtainProgresses(forRulesSetId: state.rulesSetId)
        
        let progress = progresses.first(where: { progress -> Bool in
            return progress.rule?.questions.contains(where: { $0.id == question.id }) ?? false
        })
        
        if let progress = progress {
            if progress.progress < progress.reliableProgress {
                let alreadyKnowItem = ExampleActionButtonItem(type: .alreadyKnow) { [weak self] in
                    self?.interactor.setMaximumProgress(forQuestionId: question.id)
                    self?.rebuildSection()
                }
                buttonItems.append(alreadyKnowItem)
            }
            
            let dontWantToKnow = ExampleActionButtonItem(type: .dontWantLearn) { [weak self] in
                self?.interactor.excludeRuleFromRulesSet(whichHasQuestionWithId: question.id)
                self?.rebuildSection()
            }
            buttonItems.append(dontWantToKnow)
            
            let resetProgress = ExampleActionButtonItem(type: .resetProgress) { [weak self] in
                self?.interactor.resetProgress(forQuestionId: question.id)
                self?.rebuildSection()
            }
            buttonItems.append(resetProgress)
        }

        let reportItem = ExampleActionButtonItem(type: .reportError) { [weak interactor] in
            interactor?.reportError(questionId: question.id)
        }
        buttonItems.append(reportItem)
        
        let headerItems: [TableViewItem] = [header]
        let items: [TableViewItem] = headerItems + exampleItems + buttonItems
        state.sections = [CommonAnyTypeSection(items: items, didSelectItem: nil)]
        view?.set(dataSource: state.sections)
    }
    
    private func rebuildSection() {
        if let currentQuestionId = state.currentQuestion?.id {
            state.currentQuestion = interactor.obtainQuestion(withId: currentQuestionId)
        }
        buildSection()
    }
}
