//
//  QuestionsSetsInteractor.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class QuestionsSetsInteractorImpl: QuestionsSetsInteractor {

    weak var output: QuestionsSetsInteractorOutput?

    // MARK: - QuestionsSetsInteractor
    
    func requestQuestionsSets() {
        output?.didLoadQuestionsSets(questionSet)
    }
    
}
