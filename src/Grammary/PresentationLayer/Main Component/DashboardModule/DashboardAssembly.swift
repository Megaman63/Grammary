//
//  DashboardAssembly.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class DashboardAssembly {

    static func createModule(serviceAssembly: ServiceAssembly) -> UIViewController {
        let view = DashboardViewController()
        let interactor = DashboardInteractorImpl(progressFacade: serviceAssembly.getProgressFacade(),
                                                 accountFacade: serviceAssembly.getAccountFacade())
        let router = DashboardRouterImpl(serviceAssembly: serviceAssembly)
        let presenter = DashboardPresenterImpl(view: view,
                                               interactor: interactor,
                                               router: router)

        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
