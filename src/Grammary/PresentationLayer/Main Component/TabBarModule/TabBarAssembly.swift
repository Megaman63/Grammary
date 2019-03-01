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
        view.tabBar.tintColor = .white
        view.tabBar.barTintColor = .darkTwo
        view.tabBar.backgroundImage = makeBackgroundImage()
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
        
        // Rules
        let rulesSetsController = RulesSetsAssembly.createModule(serviceAssembly: serviceAssembly)
        let rulesSetsNavigationController = UINavigationController(rootViewController: rulesSetsController)
        rulesSetsNavigationController.navigationBar.tintColor = UIColor.white.withAlphaComponent(0.5)
        rulesSetsNavigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        rulesSetsNavigationController.navigationBar.shadowImage = UIImage()
        rulesSetsNavigationController.navigationBar.isTranslucent = true
        rulesSetsNavigationController.view.backgroundColor = .clear
        
        let rulesTabBarItem = UITabBarItem(title: "Правила",
                                           image: Asset.collegeGraduation.image,
                                           selectedImage: Asset.collegeGraduation.image)
        rulesTabBarItem.tag = 0
        rulesSetsNavigationController.tabBarItem = rulesTabBarItem
        
        // Settings
        let settingsController = SettingsAssembly.createModule(serviceAssembly: serviceAssembly)
        let settingsTabBarItem = UITabBarItem(title: "Настройки",
                                              image: Asset.settingsWorkTool.image,
                                              selectedImage: Asset.settingsWorkTool.image)
        settingsTabBarItem.tag = 1
        settingsController.tabBarItem = settingsTabBarItem
        
        view.viewControllers = [
            rulesSetsNavigationController,
            settingsController
        ]

        

        return view
    }
    
    // MARK: - Private functions
    
    private static func makeBackgroundImage() -> UIImage? {
        let bg = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 48))
        bg.backgroundColor = .darkTwo
        bg.roundCorners(corners: [.topLeft, .topRight], radius: 27)
        
        UIGraphicsBeginImageContextWithOptions(bg.bounds.size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            bg.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
}
