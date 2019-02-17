//
//  ExercisePresenter+ExerciseInteractorOutput.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

fileprivate struct QuestionDTO {
    let progress: Int
    let rule: Rule
    let question: Question

    static func buildQuestions(fromProgress progress: RuleProgress) -> [QuestionDTO] {
        guard let rule = progress.rule else {
            return []
        }
        return rule.questions.map { QuestionDTO(progress: progress.progress, rule: rule, question: $0) }
    }
}

extension ExercisePresenterImpl: ExerciseInteractorOutput {

    // MARK: - ExerciseInteractorOutput

    func didLoad(progress: [RuleProgress]) {

        let questionDTOs = progress
            .map { QuestionDTO.buildQuestions(fromProgress: $0) }
            .joined()
            .shuffled()
        
        var rulesForWhichAlreadyShowsExample: [Rule] = []
        func evaluateShouldShowExampleFirst(rule: Rule, progress: Int) -> Bool {
            guard
                progress == 0,
                !rulesForWhichAlreadyShowsExample.contains(rule)
            else {
                return false
            }
            rulesForWhichAlreadyShowsExample.append(rule)
            return true
        }
        
        func buildQuestionItem(fromQuestionDTO questionDTO: QuestionDTO) -> QuestionItem {
            let shouldShowExampleFirst = evaluateShouldShowExampleFirst(rule: questionDTO.rule,
                                                                        progress: questionDTO.progress)
            return QuestionItem(question: questionDTO.question, shouldShowExampleFirst: shouldShowExampleFirst)
        }
        
        if questionDTOs.count > ExersiceConstants.countOfQuestions {
            state.questions = questionDTOs[0..<ExersiceConstants.countOfQuestions]
                .map { buildQuestionItem(fromQuestionDTO: $0) }
        } else {
            var items = questionDTOs.map { buildQuestionItem(fromQuestionDTO: $0) }
            for _ in 0..<ExersiceConstants.countOfQuestions - questionDTOs.count {
                let randomIndex = Int(arc4random() % UInt32(questionDTOs.count))
                let item = buildQuestionItem(fromQuestionDTO: questionDTOs[randomIndex])
                items.append(item)
            }
            state.questions = items
        }
        
        guard let currentQuestionItem = state.currentQuestionItem else {
            assertionFailure()
            return
        }
        show(question: currentQuestionItem)
    }
}
