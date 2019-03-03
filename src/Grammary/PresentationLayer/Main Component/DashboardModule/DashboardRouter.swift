//
//  DashboardRouter.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class DashboardRouterImpl: DashboardRouter {

    weak var viewController: UIViewController?

    private let serviceAssembly: ServiceAssembly

    init(serviceAssembly: ServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }

    // MARK: - DashboardRouter

    func showRulesSetInfo(rulesSetId: String) {
        guard
            let tbc = viewController?.tabBarController,
            let nvc = tbc.viewControllers?[safe: 1] as? UINavigationController
        else {
            assertionFailure()
            return
        }
        tbc.selectedIndex = 1
        
        let vc = RulesSetInfoAssembly.createModule(serviceAssembly: serviceAssembly, rulesSetId: rulesSetId)
        nvc.pushViewController(vc, animated: true)
    }
    
    func showRulesSets() {
        viewController?.tabBarController?.selectedIndex = 1
    }
}
