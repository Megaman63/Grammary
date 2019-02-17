//
//  SettingsProtocols.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

// MARK: - Router

protocol SettingsRouter: AnyObject {
    func dismissView()
}

// MARK: - Presenter

protocol SettingsPresenter: AnyObject {
    func didTriggerViewReadyEvent()
}

// MARK: - Interactor

protocol SettingsInteractor: AnyObject {
    func resetAllProgresses()
}

// MARK: - InteractorOutput

protocol SettingsInteractorOutput: AnyObject {

}

// MARK: - View

protocol SettingsView: AnyObject {
	var presenter: SettingsPresenter? { get set }
    func set(dataSource: [TableViewSection])
}
