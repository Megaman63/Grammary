//
//  RulesSetInfoRouter.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetInfoRouterImpl: RulesSetInfoRouter {

    weak var viewController: UIViewController?

    private let serviceAssembly: ServiceAssembly

    init(serviceAssembly: ServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }

    // MARK: - RulesSetInfoRouter

    func dismissView() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func showExercise(rulesSetId: String) {
        let vc = ExerciseAssembly.createModule(serviceAssembly: serviceAssembly, rulesSetId: rulesSetId)
        viewController?.present(vc, animated: true, completion: nil)
    }
}
