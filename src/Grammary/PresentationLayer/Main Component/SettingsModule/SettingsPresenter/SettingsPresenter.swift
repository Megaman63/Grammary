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
        let account = interactor.obtainAccount()
    
        let countOfExerciseInWeekItem = SettingsSliderItem(
            title: "Интентсивность тренировок в неделю",
            currentValue: account.countOfExercisesInWeek,
            minValue: AccountConstants.minCountOfExercisesInWeek,
            maxValue: AccountConstants.maxCountOfExercisesInWeek
        ) { [weak self] currentValue in
            self?.interactor.updateAccount(block: { $0.countOfExercisesInWeek = currentValue } )
        }
        
        let countOfQuestionInExerciseItem = SettingsSliderItem(
            title: "Длительность тренировок",
            currentValue: account.countOfQuestionInExercise,
            minValue: AccountConstants.minCountOfQuestionInExercise,
            maxValue: AccountConstants.maxCountOfQuestionInExercise
        ) { [weak self] currentValue in
            self?.interactor.updateAccount(block: { $0.countOfQuestionInExercise = currentValue } )
        }
        
        let notificationItem = SettingsSwitchItem(
            title: "Напоминания",
            subTitle: "Уведомления о том, что необходимо повторить изученные правила",
            isOn: account.notificationIsOn
        ) { [weak self] isOn in
            self?.interactor.updateAccount(block: { $0.notificationIsOn = isOn } )
        }
        
        let nameItem = SettingsNameItem.init(name: account.name) { [weak self] name in
            self?.interactor.updateAccount(block: { $0.name = name } )
        }
        
        let resetProgressItem = CommonButtonItem(name: "Reset progress") { [weak self] in
            self?.didTapResetProgressButton()
        }
        
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let grammaryVersion = SecondaryTitleItem(title: "Grammary v\(version)")
        
        let items: [TableViewItem] = [
            countOfExerciseInWeekItem,
            countOfQuestionInExerciseItem,
            notificationItem,
            nameItem,
            resetProgressItem,
            grammaryVersion,
        ]
        
        let section = CommonAnyTypeSection(items: items, didSelectItem: nil)
        view?.set(dataSource: [section])
    }
    
    // MARK: - Private functions
    
    private func didTapResetProgressButton() {
        interactor.resetAllProgresses()
    }
}
