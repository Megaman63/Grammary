//
//  ExerciseAssembly.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExerciseAssembly {

    static func createModule(serviceAssembly: ServiceAssembly, rulesSetId: String) -> UIViewController {
        let view = ExerciseViewController()
        let interactor = ExerciseInteractorImpl(exerciseFacade: serviceAssembly.getExerciseFacade(),
                                                progressFacade: serviceAssembly.getProgressFacade())
        let router = ExerciseRouterImpl(serviceAssembly: serviceAssembly)
        let state = ExerciseState(rulesSetId: rulesSetId)
        let presenter = ExercisePresenterImpl(view: view,
                                              interactor: interactor,
                                              router: router,
                                              state: state)

        view.presenter = presenter
        view.exampleViewFactory = { [weak presenter] in
            let (moduleInput, view) = ExampleAssembly.createModule(serviceAssembly: serviceAssembly)
            presenter?.exampleModuleInput = moduleInput
            return view
        }
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
