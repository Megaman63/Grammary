//
//  ExerciseAssembly.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExerciseAssembly {

    static func createModule(serviceAssembly: ServiceAssembly, questionsSetId: String) -> UIViewController {
        let view = ExerciseViewController()
        let interactor = ExerciseInteractorImpl(exerciseFacade: serviceAssembly.getExerciseFacade())
        let router = ExerciseRouterImpl(serviceAssembly: serviceAssembly)
        let state = ExerciseState(questionsSetId: questionsSetId)
        let presenter = ExercisePresenterImpl(view: view,
                                              interactor: interactor,
                                              router: router,
                                              state: state)

        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
