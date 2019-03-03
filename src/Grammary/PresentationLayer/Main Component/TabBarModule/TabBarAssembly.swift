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
        let view = TabBarController()
        
        view.viewControllers = [
            makeDashboardViewController(serviceAssembly: serviceAssembly),
            makeRulesSetsViewController(serviceAssembly: serviceAssembly),
            makeSettingsViewController(serviceAssembly: serviceAssembly)
        ]
        
        return view
    }
    
    // MARK: - Private functions
    
    private static func makeDashboardViewController(serviceAssembly: ServiceAssembly) -> UIViewController {
        let dashboardViewController = DashboardAssembly.createModule(serviceAssembly: serviceAssembly)
        
        let tabBarItem = UITabBarItem(title: "Главная",
                                      image: Asset.house.image,
                                      selectedImage: Asset.house.image)
        tabBarItem.tag = 0
        dashboardViewController.tabBarItem = tabBarItem
        
        return dashboardViewController
    }
    
    private static func makeRulesSetsViewController(serviceAssembly: ServiceAssembly) -> UIViewController {
        let rulesSetsController = RulesSetsAssembly.createModule(serviceAssembly: serviceAssembly)
        let rulesSetsNavigationController = UINavigationController(rootViewController: rulesSetsController)
        rulesSetsNavigationController.navigationBar.tintColor = UIColor.white.withAlphaComponent(0.5)
        rulesSetsNavigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        rulesSetsNavigationController.navigationBar.shadowImage = UIImage()
        rulesSetsNavigationController.navigationBar.isTranslucent = true
        rulesSetsNavigationController.view.backgroundColor = .clear
        
        let tabBarItem = UITabBarItem(title: "Правила",
                                      image: Asset.collegeGraduation.image,
                                      selectedImage: Asset.collegeGraduation.image)
        tabBarItem.tag = 1
        rulesSetsNavigationController.tabBarItem = tabBarItem
        
        return rulesSetsNavigationController
    }
    
    private static func makeSettingsViewController(serviceAssembly: ServiceAssembly) -> UIViewController {
        let settingsController = SettingsAssembly.createModule(serviceAssembly: serviceAssembly)
        let tabBarItem = UITabBarItem(title: "Настройки",
                                      image: Asset.settingsWorkTool.image,
                                      selectedImage: Asset.settingsWorkTool.image)
        tabBarItem.tag = 2
        settingsController.tabBarItem = tabBarItem
        return settingsController
    }
}
