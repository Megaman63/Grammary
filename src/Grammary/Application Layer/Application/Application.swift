//
//  Application.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class Application {
    
    // MARK: - Private properties
    
    private let serviceAssembly: ServiceAssembly
    private let window: UIWindow?
    private let updateFacade: UpdatesFacade
    
    // MARK: - Init
    
    init(window: UIWindow?, serviceAssembly: ServiceAssembly) {
        
        self.window = window
        self.serviceAssembly = serviceAssembly
        
        self.updateFacade = serviceAssembly.getUpdateFacade()
    }
    
    // MARK: - Public functions
    
    func startApplication() {
        updateFacade.updateQuestionAndAddRulesSetsIfNeeded()
        
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.absoluteString ?? "nil"
        print(url)
        
        window?.rootViewController = TabBarAssembly.createModule(serviceAssembly: serviceAssembly)
    }
}
