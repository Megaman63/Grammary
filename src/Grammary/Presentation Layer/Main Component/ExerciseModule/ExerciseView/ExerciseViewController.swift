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
        view.insertSubview(exampleView, belowSubview: nextButton)
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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
        answerButtons.forEach {
            $0.titleLabel?.numberOfLines = 0
            $0.titleLabel?.textAlignment = .center
        }
        
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
    
    @IBAction func nextButtonTap(_ sender: UIButton) {
        presenter?.didTapNextButton()
    }
    
    @IBAction func closeButtonTap(_ sender: Any) {
        presenter?.didTapCloseButton()
    }
    
    // MARK: - ExerciseView

    var presenter: ExercisePresenter?
    
    func show(question: QuestionItem) {
        if answersStackView.isHidden {
            answersStackView.isHidden = false
            nextButton.isHidden = true
            exampleView?.isHidden = true
        }
        
        for (index, button) in answerButtons.enumerated() {
            if index < question.answers.count{
                button.setTitle(question.answers[index].text, for: .normal)
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
        ruleLabel.text = question.ruleTitle + "\n\n" + question.ruleSubject
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
            animations: { [weak correctButton, wrongButton] in
                correctButton?.backgroundColor = .green
                wrongButton?.backgroundColor = .red
        }, completion: { [weak self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {  [weak correctButton, wrongButton] in
                self?.answerButtons.forEach { $0.isUserInteractionEnabled = true }
                correctButton?.backgroundColor = nil
                wrongButton?.backgroundColor = nil
                self?.presenter?.didShowAnswer()
            }
        })
    }
    
    func showExample() {
        answersStackView.isHidden = true
        exampleView?.isHidden = false
        nextButton.isHidden = false
    }
    
    // MARK: - Private functions
    
}
