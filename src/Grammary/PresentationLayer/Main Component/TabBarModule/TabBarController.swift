//
//  TabBarController.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - Private properties
    
    private var tabBarHeight: CGFloat = 0 {
        didSet {
            if oldValue != tabBarHeight {
                let tabBarHeight = tabBar.frame.height
                tabBar.backgroundImage = makeBackgroundImage(height: tabBarHeight)
            }
        }
    }
    
    // MARK: - UITabBarController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .white
        tabBar.barTintColor = .darkTwo
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarHeight = tabBar.frame.height
    }
    
    // MARK: - Private functions
    
    private func makeBackgroundImage(height: CGFloat) -> UIImage? {
        let bg = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height))
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
