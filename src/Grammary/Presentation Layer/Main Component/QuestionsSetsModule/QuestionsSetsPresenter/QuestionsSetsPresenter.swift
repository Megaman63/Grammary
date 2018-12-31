//
//  QuestionsSetsPresenter.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class QuestionsSetsPresenterImpl: QuestionsSetsPresenter {

    weak var view: QuestionsSetsView?
    var interactor: QuestionsSetsInteractor
    let router: QuestionsSetsRouter

    // MARK: - State

    var state: QuestionsSetsState

    // MARK: - Init

    init(view: QuestionsSetsView,
         interactor: QuestionsSetsInteractor,
         router: QuestionsSetsRouter,
         state: QuestionsSetsState) {

        self.view = view
        self.interactor = interactor
        self.router = router
        self.state = state
    }

    // MARK: - QuestionsSetsPresenter
    
    func didTriggerViewReadyEvent() {
        interactor.requestQuestionsSets()
    }
}
