//
//  ExerciseInteractor.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExerciseInteractorImpl: ExerciseInteractor {

    weak var output: ExerciseInteractorOutput?

    // MARK: - ExerciseInteractor
    
    func loadQuestions(forSetWithId id: String) {
        guard let set = questionSet.first(where: { $0.id == id }) else {
            return
        }
        output?.didLoad(questions: set.progress.map { $0.question })
    }
}
