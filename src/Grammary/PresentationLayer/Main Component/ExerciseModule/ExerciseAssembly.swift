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
        let exerciseView = ExerciseViewController()
        let interactor = ExerciseInteractorImpl(exerciseFacade: serviceAssembly.getExerciseFacade(),
                                                progressFacade: serviceAssembly.getProgressFacade())
        let router = ExerciseRouterImpl(serviceAssembly: serviceAssembly)
        let state = ExerciseState(rulesSetId: rulesSetId)
        let presenter = ExercisePresenterImpl(view: exerciseView,
                                              interactor: interactor,
                                              router: router,
                                              state: state)

        exerciseView.presenter = presenter
        interactor.output = presenter
        router.viewController = exerciseView

        let (moduleInput, exampleView) = ExampleAssembly.createModule(serviceAssembly: serviceAssembly,
                                                                      moduleOutput: presenter,
                                                                      rulesSetId: rulesSetId)
        presenter.exampleModuleInput = moduleInput
        
        let pulley = PulleyViewController(contentViewController: exerciseView,
                                          drawerViewController: exampleView)
        
        pulley.delegates.register(exerciseView)
        pulley.delegates.register(exampleView)
        pulley.initialDrawerPosition = .closed
        pulley.drawerCornerRadius = 30

        return pulley
    }
}
