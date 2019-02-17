//
//  ExampleAssembly.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExampleAssembly {

    static func createModule(serviceAssembly: ServiceAssembly,
                             moduleOutput: ExampleModuleOutput,
                             rulesSetId: String) -> (ExampleModuleInput, ExampleViewController) {
        let view = ExampleViewController()
        let interactor = ExampleInteractorImpl(progressFacade: serviceAssembly.getProgressFacade(),
                                               exerciseFacade: serviceAssembly.getExerciseFacade())
        let state = ExampleState(rulesSetId: rulesSetId)
        let presenter = ExamplePresenterImpl(view: view,
                                             interactor: interactor,
                                             moduleOutput: moduleOutput,
                                             state: state)

        view.presenter = presenter
        interactor.output = presenter

        return (presenter, view)
    }
}
