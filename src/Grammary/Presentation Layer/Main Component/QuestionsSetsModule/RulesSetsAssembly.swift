//
//  RulesSetsAssembly.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetsAssembly {

    static func createModule(serviceAssembly: ServiceAssembly) -> UIViewController {
        let view = RulesSetsViewController()
        let interactor = RulesSetsInteractorImpl(exerciseFacade: serviceAssembly.getExerciseFacade())
        let router = RulesSetsRouterImpl(serviceAssembly: serviceAssembly)
        let state = RulesSetsState()
        let presenter = RulesSetsPresenterImpl(view: view,
                                                   interactor: interactor,
                                                   router: router,
                                                   state: state)

        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
