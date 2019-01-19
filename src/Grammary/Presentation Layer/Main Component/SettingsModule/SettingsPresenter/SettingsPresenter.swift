//
//  SettingsPresenter.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class SettingsPresenterImpl: SettingsPresenter {

    weak var view: SettingsView?
    var interactor: SettingsInteractor
    let router: SettingsRouter

    // MARK: - State

    var state: SettingsState

    // MARK: - Init

    init(view: SettingsView,
         interactor: SettingsInteractor,
         router: SettingsRouter,
         state: SettingsState) {

        self.view = view
        self.interactor = interactor
        self.router = router
        self.state = state
    }

    // MARK: - SettingsPresenter

    func didTriggerViewReadyEvent() {
        let resetProgressItem = CommonButtonItem(name: "Reset progress") { [weak self] in
            self?.didTapResetProgressButton()
        }
        
        let section = CommonSection(items: [resetProgressItem], didSelectItem: nil)
        view?.setDataSource([section])
    }
    
    // MARK: - Private functions
    
    private func didTapResetProgressButton() {
        interactor.resetAllProgresses()
    }
}
