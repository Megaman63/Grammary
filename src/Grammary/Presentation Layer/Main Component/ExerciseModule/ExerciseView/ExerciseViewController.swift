//
//  ExerciseViewController.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExerciseViewController: UIViewController, ExerciseView {

    // MARK: - Public properties
    
    var exampleViewFactory: ( () -> UIView )?
    
    // MARK: - Private properties
    
    private lazy var exampleView: UIView! = {
        guard let exampleView = exampleViewFactory?() else {
            assertionFailure()
            return nil
        }
        view.addSubview(exampleView)
        exampleView.snp.makeConstraints {
            $0.top.equalTo(ruleLabel)
            $0.bottom.left.right.equalToSuperview()
        }
        return exampleView
    }()
    
    // MARK: - Outlets

    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var ruleLabel: UILabel!
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
    
    func showRule(_ rule: Rule) {
        answersStackView.isHidden = false
        for (index, button) in answerButtons.enumerated() {
            if index < rule.answers.count{
                button.setTitle(rule.answers[index].text, for: .normal)
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
        ruleLabel.text = rule.ruleTitle + "\n\n" + rule.ruleSubject
    }
    
    func showAnswer(animation: RuleAppearanceAnimation) {
        var correctButton: UIButton? = nil
        var wrongButton: UIButton? = nil
        
        switch animation {
        case .correctAnswer(let index):
            correctButton = answerButtons[index]
        case .wrongAnswer(let correctIndex, let wrongIndex):
            correctButton = answerButtons[correctIndex]
            wrongButton =  answerButtons[wrongIndex]
        }
        
        answerButtons.forEach { $0.isUserInteractionEnabled = false }
        UIView.animate(
            withDuration: PresentationConstants.animationDuration,
            animations: {
                correctButton?.backgroundColor = .green
                wrongButton?.backgroundColor = .red
        }, completion: { _ in
            self.answerButtons.forEach { $0.isUserInteractionEnabled = true }
            correctButton?.backgroundColor = nil
            wrongButton?.backgroundColor = nil
            self.presenter?.didShowAnswer()
        })
    }
    
    func showExample() {
        answersStackView.isHidden = true
        exampleView?.isHidden = false
    }
    
    // MARK: - Private functions
    
    private func showExamples(forRule rule: Rule) {
        answersStackView.isHidden = true
    }
    
}
