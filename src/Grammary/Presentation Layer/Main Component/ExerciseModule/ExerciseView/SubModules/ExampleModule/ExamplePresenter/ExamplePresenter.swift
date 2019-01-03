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
    
    func didTapClearProgressButton() {
        
    }
    
    func didTapAlreadyKnowButton() {
        
    }
    
    // MARK: - ExampleModuleInput
    
    func set(examples: [Example], correctAnswer: String) {
        state.examples = examples
        let correctItem = ExampleItem(text: correctAnswer)
        let exampleItems = state.examples.map { ExampleItem(text: $0.text ) }
        state.sections = [CommonSection(items: [correctItem] + exampleItems,
                                        didSelectItem: nil)]
        view?.setDataSource(state.sections)
    }
}
