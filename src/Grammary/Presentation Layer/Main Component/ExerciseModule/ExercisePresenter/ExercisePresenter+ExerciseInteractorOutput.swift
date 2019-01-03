//
//  ExercisePresenter+ExerciseInteractorOutput.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

extension ExercisePresenterImpl: ExerciseInteractorOutput {

    // MARK: - ExerciseInteractorOutput

    func didLoad(rules: [Rule]) {
        state.rules = rules
        
        guard let currentRule = state.rules.first else {
            return
        }
        
        view?.showRule(currentRule)
    }
}
