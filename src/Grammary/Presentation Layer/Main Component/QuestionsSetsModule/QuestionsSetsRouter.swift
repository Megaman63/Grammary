//
//  QuestionsSetsRouter.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class QuestionsSetsRouterImpl: QuestionsSetsRouter {

    weak var viewController: UIViewController?

    private let serviceAssembly: ServiceAssembly

    init(serviceAssembly: ServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }

    // MARK: - QuestionsSetsRouter

    func dismissView() {

    }
}
