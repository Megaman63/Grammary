//
//  AnswersAnimationTests.swift
//  GrammaryTests
//
//  Created by Sergey Grebenozhko on 2/10/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import XCTest
@testable import Grammary

class AnswersAnimationTests: XCTestCase {

    func testCorrectAnswerIsFirst() {
        // arrange
        let animation = RuleAppearance.correctAnswer(correctIndex: 0)
        let examples: [AnswersAnimationType] = [
            .shouldChangeIndex(currentIndex: 0, newIndex: 0),
            .none,
            .none,
            .none
        ]
        
        // act & assert
        evaluateAndCheck(ruleAppearanceAnimation: animation, examples: examples)
    }
    
    func testCorrectAnswerIsSecond() {
        // arrange
        let animation = RuleAppearance.correctAnswer(correctIndex: 1)
        let examples: [AnswersAnimationType] = [
            .shouldDissappear,
            .shouldChangeIndex(currentIndex: 1, newIndex: 0),
            .none,
            .none
        ]
        
        // act & assert
        evaluateAndCheck(ruleAppearanceAnimation: animation, examples: examples)
    }
    
    func testCorrectAnswerIsLast() {
        // arrange
        let animation = RuleAppearance.correctAnswer(correctIndex: 3)
        let examples: [AnswersAnimationType] = [
            .shouldDissappear,
            .shouldDissappear,
            .shouldDissappear,
            .shouldChangeIndex(currentIndex: 3, newIndex: 0)
        ]
        
        // act & assert
        evaluateAndCheck(ruleAppearanceAnimation: animation, examples: examples)
    }
    
    func testCorrectAnswerIsLastWrongIsFirst() {
        // arrange
        let animation = RuleAppearance.wrongAnswer(correctIndex: 3, wrongIndex: 0)
        let examples: [AnswersAnimationType] = [
            .shouldChangeIndex(currentIndex: 0, newIndex: 0),
            .shouldDissappear,
            .shouldDissappear,
            .shouldChangeIndex(currentIndex: 3, newIndex: 1)
        ]
        
        // act & assert
        evaluateAndCheck(ruleAppearanceAnimation: animation, examples: examples)
    }
    
    func testCorrectAnswerIsFirstWrongIsLast() {
        // arrange
        let animation = RuleAppearance.wrongAnswer(correctIndex: 0, wrongIndex: 3)
        let examples: [AnswersAnimationType] = [
            .shouldChangeIndex(currentIndex: 0, newIndex: 0),
            .shouldDissappear,
            .shouldDissappear,
            .shouldChangeIndex(currentIndex: 3, newIndex: 1)
        ]
        
        // act & assert
        evaluateAndCheck(ruleAppearanceAnimation: animation, examples: examples)
    }
    
    func testCorrectAnswerIsFirstWrongIsThird() {
        // arrange
        let animation = RuleAppearance.wrongAnswer(correctIndex: 0, wrongIndex: 2)
        let examples: [AnswersAnimationType] = [
            .shouldChangeIndex(currentIndex: 0, newIndex: 0),
            .shouldDissappear,
            .shouldChangeIndex(currentIndex: 2, newIndex: 1),
            .none
        ]
        
        // act & assert
        evaluateAndCheck(ruleAppearanceAnimation: animation, examples: examples)
    }
    
    func testCorrectAnswerIsFirstWrongIsSecond() {
        // arrange
        let animation = RuleAppearance.wrongAnswer(correctIndex: 0, wrongIndex: 1)
        let examples: [AnswersAnimationType] = [
            .shouldChangeIndex(currentIndex: 0, newIndex: 0),
            .shouldChangeIndex(currentIndex: 1, newIndex: 1),
            .none,
            .none
        ]
        
        // act & assert
        evaluateAndCheck(ruleAppearanceAnimation: animation, examples: examples)
    }
    
    func testCorrectAnswerIsLastWrongIsThird() {
        // arrange
        let animation = RuleAppearance.wrongAnswer(correctIndex: 3, wrongIndex: 2)
        let examples: [AnswersAnimationType] = [
            .shouldDissappear,
            .shouldDissappear,
            .shouldChangeIndex(currentIndex: 2, newIndex: 0),
            .shouldChangeIndex(currentIndex: 3, newIndex: 1)
        ]
        
        // act & assert
        evaluateAndCheck(ruleAppearanceAnimation: animation, examples: examples)
    }
    
    func testCorrectAnswerIsThirdWrongIsSecond() {
        // arrange
        let animation = RuleAppearance.wrongAnswer(correctIndex: 2, wrongIndex: 1)
        let examples: [AnswersAnimationType] = [
            .shouldDissappear,
            .shouldChangeIndex(currentIndex: 1, newIndex: 0),
            .shouldChangeIndex(currentIndex: 2, newIndex: 1),
            .none
        ]
        
        // act & assert
        evaluateAndCheck(ruleAppearanceAnimation: animation, examples: examples)
    }
    
    // MARK: - act & assert
    
    func evaluateAndCheck(ruleAppearanceAnimation: RuleAppearance,
                          examples: [AnswersAnimationType]) {
        // arrange
        var answersAnimation = AnswersAnimation()
        
        // act
        answersAnimation.calculateAnimations(animation: ruleAppearanceAnimation)
        
        // asserts
        for (index, animationType) in answersAnimation.animations.enumerated() {
            XCTAssert(animationType == examples[index],
                      "animation: \(ruleAppearanceAnimation)\n" +
                      "\(index): result \(animationType) should be equal to example \(examples[index])")
        }
    }
}
