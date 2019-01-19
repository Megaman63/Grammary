//
//  SettingsAssembly.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class SettingsAssembly {
    
    static func createModule(serviceAssembly: ServiceAssembly) -> UIViewController {
        let view = SettingsViewController()
        let interactor = SettingsInteractorImpl(progressFacade: serviceAssembly.getProgressFacade())
        let router = SettingsRouterImpl(serviceAssembly: serviceAssembly)
        let state = SettingsState()
        let presenter = SettingsPresenterImpl(view: view,
                                              interactor: interactor,
                                              router: router,
                                              state: state)
        
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
