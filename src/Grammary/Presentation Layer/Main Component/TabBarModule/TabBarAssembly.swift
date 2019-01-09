//
//  TabBarAssembly.swift
//  Grammary
//
//  Created Сергей Гребеножко on 31/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class TabBarAssembly {

    static func createModule(serviceAssembly: ServiceAssembly) -> UIViewController {
        let view = UITabBarController()
        
        let rulesSetsController = RulesSetsAssembly.createModule(serviceAssembly: serviceAssembly)
        view.viewControllers = [
            UINavigationController(rootViewController: rulesSetsController)
        ]

        return view
    }
}
