//
//  ExampleAssembly.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExampleAssembly {

    static func createModule(serviceAssembly: ServiceAssembly) -> (ExampleModuleInput, UIView) {
        let view = ExampleViewImpl()
        let interactor = ExampleInteractorImpl()
        let state = ExampleState()
        let presenter = ExamplePresenterImpl(view: view,
                                             interactor: interactor,
                                             state: state)

        view.presenter = presenter
        interactor.output = presenter

        return (presenter, view)
    }
}
