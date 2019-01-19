//
//  SettingsInteractor.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class SettingsInteractorImpl: SettingsInteractor {

    weak var output: SettingsInteractorOutput?

    // MARK: - Private properties
    
    private let progressFacade: ProgressFacade
    
    // MARK: - Init
    
    init(progressFacade: ProgressFacade) {
        self.progressFacade = progressFacade
    }
    
    // MARK: - SettingsInteractor
    
    func resetAllProgresses() {
        progressFacade.resetAllProgresses()
    }
}
