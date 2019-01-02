//
//  ServiceAssembly.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation

protocol ServiceAssembly: AnyObject {
    func getExerciseFacade() -> ExerciseFacade
}

final class ServiceAssemblyImpl: ServiceAssembly {
    
    // MARK: - ServiceAssembly
    
    func getExerciseFacade() -> ExerciseFacade {
        return ExerciseFacadeImpl(questionLocalService: QuestionLocalServiceImpl(),
                                  questionsSetLocalService: QuestionsSetLocalServiceImpl())
    }
}
