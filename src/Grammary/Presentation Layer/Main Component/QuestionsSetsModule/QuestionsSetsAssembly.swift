//
//  QuestionsSetsAssembly.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class QuestionsSetsAssembly {

    static func createModule(serviceAssembly: ServiceAssembly) -> UIViewController {
        let view = QuestionsSetsViewController()
        let interactor = QuestionsSetsInteractorImpl()
        let router = QuestionsSetsRouterImpl(serviceAssembly: serviceAssembly)
        let state = QuestionsSetsState(sets: [], items: [])
        let presenter = QuestionsSetsPresenterImpl(view: view,
                                                   interactor: interactor,
                                                   router: router,
                                                   state: state)

        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
