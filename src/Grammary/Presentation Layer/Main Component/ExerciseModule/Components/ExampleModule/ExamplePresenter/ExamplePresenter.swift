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
    var interactor: ExampleInteractor

    // MARK: - State

    var state: ExampleState

    // MARK: - Init

    init(view: ExampleView,
         interactor: ExampleInteractor,
         state: ExampleState) {

        self.view = view
        self.interactor = interactor
        self.state = state
    }

    // MARK: - ExamplePresenter
    
    // MARK: - ExampleModuleInput
    
    func set(currentQuestionId: String) {
        state.currentQuestion = interactor.obtainQuestion(withId: currentQuestionId)
        buildSection()
    }
    
    // MARK: - Private functions
    
    private func buildSection() {
        guard let question = state.currentQuestion else {
            assertionFailure()
            return
        }
        
        state.examples = question.examples.map { $0 }
        let correctItem = ExampleItem(text: question.correctAnswer?.text ?? "")
        let exampleItems = state.examples.map { ExampleItem(text: $0.text ) }
        
        var buttonItems: [TableViewItem] = []
        
        
        let progresses = interactor.obtainProgresses(forRulesSetId: state.rulesSetId)
        
        let progress = progresses.first(where: { progress -> Bool in
            return progress.rule?.questions.contains(where: { $0.id == question.id }) ?? false
        })
        
        if let progress = progress {
            if progress.progress < progress.reliableProgress {
                let alreadyKnowItem = CommonButtonItem(name: "Уже знаю") { [weak self] in
                    self?.interactor.setMaximumProgress(forQuestionId: question.id)
                    self?.rebuildSection()
                }
                buttonItems.append(alreadyKnowItem)
            }
            
            let dontWantToKnow = CommonButtonItem(name: "Не хочу учить") { [weak self] in
                self?.interactor.excludeRuleFromRulesSet(whichHasQuestionWithId: question.id)
                self?.rebuildSection()
            }
            buttonItems.append(dontWantToKnow)
            
            let resetProgress = CommonButtonItem(name: "Сбросить прогресс") { [weak self] in
                self?.interactor.resetProgress(forQuestionId: question.id)
                self?.rebuildSection()
            }
            buttonItems.append(resetProgress)
        }

        let reportItem = CommonButtonItem(name: "Здесь ошибка") { [weak interactor] in
            interactor?.reportError(questionId: question.id)
        }
        buttonItems.append(reportItem)
        
        let items: [TableViewItem] = [correctItem] + exampleItems + buttonItems
        state.sections = [CommonAnyTypeSection(items: items, didSelectItem: nil)]
        view?.setDataSource(state.sections)
    }
    
    private func rebuildSection() {
        if let currentQuestionId = state.currentQuestion?.id {
            state.currentQuestion = interactor.obtainQuestion(withId: currentQuestionId)
        }
        buildSection()
    }
}
