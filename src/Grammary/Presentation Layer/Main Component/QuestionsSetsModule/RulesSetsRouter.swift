//
//  RulesSetsRouter.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetsRouterImpl: RulesSetsRouter {

    weak var viewController: UIViewController?

    private let serviceAssembly: ServiceAssembly

    init(serviceAssembly: ServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }

    // MARK: - RulesSetsRouter

    func showExercise(rulesSetId: String) {
        let vc = ExerciseAssembly.createModule(serviceAssembly: serviceAssembly, rulesSetId: rulesSetId)
        viewController?.present(vc, animated: true, completion: nil)
    }
}
