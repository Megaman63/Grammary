//
//  RulesSetInfoAssembly.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetInfoAssembly {

    static func createModule(serviceAssembly: ServiceAssembly, rulesSetId: String) -> UIViewController {
        let view = RulesSetInfoViewController()
        let interactor = RulesSetInfoInteractorImpl(
            rulesSetNotificationCenter: serviceAssembly.rulesSetNotificationCenter
        )
        let router = RulesSetInfoRouterImpl(serviceAssembly: serviceAssembly)
        let state = RulesSetInfoState(rulesSetId: rulesSetId)
        let presenter = RulesSetInfoPresenterImpl(view: view,
                                                  interactor: interactor,
                                                  router: router,
                                                  state: state)

        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
