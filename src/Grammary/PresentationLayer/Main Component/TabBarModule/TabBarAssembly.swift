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
        rulesSetsController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let settingsController = SettingsAssembly.createModule(serviceAssembly: serviceAssembly)
        settingsController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

        let rulesSetsNavigationController = UINavigationController(rootViewController: rulesSetsController)
        rulesSetsNavigationController.navigationBar.barTintColor = .dark
        rulesSetsNavigationController.navigationBar.isTranslucent = false
        rulesSetsNavigationController.navigationBar.tintColor = UIColor.white.withAlphaComponent(0.5)
        
        view.viewControllers = [
            rulesSetsNavigationController,
            UINavigationController(rootViewController: settingsController)
        ]

        return view
    }
}
