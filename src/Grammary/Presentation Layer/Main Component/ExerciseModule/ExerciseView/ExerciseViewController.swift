//
//  ExerciseViewController.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExerciseViewController: UIViewController, ExerciseView {

    // MARK: - Outlets

    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answersStackView: UIStackView!
    
    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didTriggerViewReadyEvent()
    }

    // MARK: - Actions

    @IBAction func answerButtonTap(_ sender: UIButton) {
        guard let index = answerButtons.index(where: { $0 === sender })  else {
            assertionFailure()
            return
        }
        presenter?.didChooseAnswer(atIndex: index)
    }
    
    // MARK: - ExerciseView

    var presenter: ExercisePresenter?
    
    func showQuestion(_ question: Question, animation: QuestionAppearanceAnimation) {
        switch animation {
        case .none:
            changeTitles(nextQuestion: question)
            
        case .correctAnswer(let index):
            animateCorrectAnswer(correctButton: answerButtons[index],
                                 nextQuestion: question)
            
        case .wrongAnswer(let correctIndex, let wrongIndex):
            animateWrongAnswer(correctButton: answerButtons[correctIndex],
                               wrongButton: answerButtons[wrongIndex],
                               nextQuestion: question)
        }
    }
    
    // MARK: - Private functions
    
    private func animateWrongAnswer(correctButton: UIButton, wrongButton: UIButton, nextQuestion: Question) {
        answerButtons.forEach { $0.isUserInteractionEnabled = false }
        UIView.animate(
            withDuration: PresentationConstants.animationDuration,
            animations: {
                correctButton.backgroundColor = .green
                wrongButton.backgroundColor = .red
        }, completion: { _ in
            self.answerButtons.forEach { $0.isUserInteractionEnabled = true }
            correctButton.backgroundColor = nil
            wrongButton.backgroundColor = nil
            self.changeTitles(nextQuestion: nextQuestion)
        })
    }
    
    private func animateCorrectAnswer(correctButton: UIButton, nextQuestion: Question) {
        answerButtons.forEach { $0.isUserInteractionEnabled = false }
        UIView.animate(
            withDuration: PresentationConstants.animationDuration,
            animations: {
                correctButton.backgroundColor = .green
        }, completion: { _ in
            self.answerButtons.forEach { $0.isUserInteractionEnabled = true }
            correctButton.backgroundColor = nil
            self.changeTitles(nextQuestion: nextQuestion)
        })
    }
    
    private func changeTitles(nextQuestion: Question) {
        for (index, button) in answerButtons.enumerated() {
            if index < nextQuestion.answers.count{
                button.setTitle(nextQuestion.answers[index].text, for: .normal)
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
        questionLabel.text = nextQuestion.questionTitle + "\n\n" + nextQuestion.questionSubject
    }
}
