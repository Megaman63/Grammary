//
//  AppDelegate.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var serviceAssembly: ServiceAssembly!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        parse()
        serviceAssembly = ServiceAssemblyImpl()
        window?.rootViewController = TabBarAssembly.createModule(serviceAssembly: serviceAssembly)
        
        let url = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first?.absoluteString ?? "nil"
        print(url)
        return true
    }
}

