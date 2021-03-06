//
//  ExerciseViewController.swift
//  Grammary
//
//  Created Сергей Гребеножко on 26/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class ExerciseViewController: UIViewController, ExerciseView {
    
    private enum QuestionState {
        case answered, awaitingAnswer
    }
    
    private enum Constants {
        static let backdropAndAnswerGap: CGFloat = 10
        static let separatorAndAnswerGap: CGFloat = 24
        static let answersGap: CGFloat = 12
    }
    
    // MARK: - Private properties
    
    private var firstAppear = true
    private var scrollView: UIScrollView!
    private var scrollContentView: UIView!
    private var progressView: ProgressView!
    private var chooseAnswerLabel: UILabel!
    private var ruleQuestionLabel: UILabel!
    private var separator: UIView!
    private var answerViews: [AnswerView] = []
    
    private var partialRevealDrawerHeight: CGFloat = 616
    private var questionState = QuestionState.awaitingAnswer
    private var answersAnimation = AnswersAnimation()
    
    // MARK: - UIViewController

	override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if firstAppear {
            firstAppear = false
            configureViews()
            presenter?.didTriggerViewReadyEvent()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculateScrollViewContentHeight()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calculateScrollViewContentHeight()
    }
    
    deinit {
        presenter?.didTriggerViewDeinitEvent()
    }
    
    // MARK: - Actions

    @objc func answerLabelTap(_ sender: UITapGestureRecognizer) {
        guard let index = answerViews.index(where: { $0 === sender.view }) else {
            assertionFailure()
            return
        }
        presenter?.didChooseAnswer(atIndex: index)
    }
    
    @objc func closeButtonTap(_ sender: Any) {
        presenter?.didTapCloseButton()
    }
    
    // MARK: - ExerciseView

    var presenter: ExercisePresenter?
    
    func show(question: QuestionItem) {
        questionState = .awaitingAnswer
        answerViews.enumerated().forEach { (index, answerView) in
            answerView.resetAnswerState()
            answerView.isUserInteractionEnabled = true
            answerView.snp.remakeConstraints {
                $0.trailing.equalToSuperview().offset(-16)
                $0.leading.equalToSuperview().offset(16)
                if index == 0 {
                    $0.top.equalTo(separator.snp.bottom).offset(Constants.separatorAndAnswerGap)
                } else {
                    $0.top.equalTo(answerViews[index-1].snp.bottom).offset(12)
                }
            }
            if index < question.answers.count{
                answerView.text = question.answers[index].text
                answerView.isHidden = false
            } else {
                answerView.isHidden = true
            }
        }
        
        var text = question.ruleTitle
        if !question.ruleSubject.isEmpty {
            text = text + "\n\n" + question.ruleSubject
        }
        ruleQuestionLabel.text = text
        
        if let pulley = pulleyViewController, pulley.drawerPosition != .closed {
            pulley.setDrawerPosition(position: .closed, animated: true)
            UIView.animate(withDuration: pulley.animationDuration) {
                self.answerViews.forEach { $0.alpha = 1 }
                self.view.layoutIfNeeded()
            }
        }
        
        if question.shouldShowExampleFirst {
            presenter?.didChooseAnswer(atIndex: question.correctAnswer)
        }
        view.setNeedsLayout()
    }
    
    func set(progress: CGFloat) {
        progressView.set(progress: progress, animated: true)
    }
    
    func showAnswer(ruleAppearance: RuleAppearance, animated: Bool) {
        questionState = .answered
        let (correctAnswerView, wrongAnswerView) = getWrongAndCorrectAnswersView(appearance: ruleAppearance)
        answerViews.forEach { $0.isUserInteractionEnabled = false }
        correctAnswerView.showAnswerResult(correctAnswer: true, animated: animated) { [weak self] in
            if animated {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    self?.calculate(appearance: ruleAppearance, animated: true)
                }
            } else {
                self?.calculate(appearance: ruleAppearance, animated: false)
            }
        }
        wrongAnswerView?.showAnswerResult(correctAnswer: false, animated: animated)
    }
    
    func showExample(animated: Bool) {
        guard let pulley = pulleyViewController else {
            assertionFailure()
            return
        }
        pulley.setDrawerPosition(position: .partiallyRevealed, animated: true)
        
        if animated {
            UIView.animate(withDuration: pulley.animationDuration) {
                self.setAlphaToDissappearingAnswerViews(alpha: 0)
            }
        } else {
            setAlphaToDissappearingAnswerViews(alpha: 0)
        }
    }
    
    // MARK: - Private functions
    
    private func calculate(appearance: RuleAppearance, animated: Bool) {
        let (correctAnswerView, wrongAnswerView) = getWrongAndCorrectAnswersView(appearance: appearance)
        
        let correctFrame = correctAnswerView.frame
        if let wrongFrame = wrongAnswerView?.frame {
            partialRevealDrawerHeight = view.frame.height - (
                separator.frame.maxY +
                Constants.separatorAndAnswerGap +
                correctFrame.height +
                Constants.answersGap +
                wrongFrame.height +
                Constants.backdropAndAnswerGap
            )
        } else {
            partialRevealDrawerHeight = view.frame.height - (
                separator.frame.maxY +
                Constants.separatorAndAnswerGap +
                correctFrame.height +
                Constants.backdropAndAnswerGap
            )
        }
        print("calculate view.frame.height \(view.frame.height)")
        answersAnimation.calculateAnimations(appearance: appearance)
        presenter?.didShowAnswer(partialRevealDrawerHeight: partialRevealDrawerHeight)

        var firstAnswerViewHeight: CGFloat? = nil
        for (index, animation) in answersAnimation.animations.enumerated() {
            switch animation {
            case .shouldDissappear, .none:
                answerViews[index].alpha = 0
            case .shouldChangeIndex(let currentIndex, _):
                let answerView = answerViews[currentIndex]
                
                let delta: CGFloat
                if let firstAnswerViewHeight = firstAnswerViewHeight {
                    let firstViewOffset = firstAnswerViewHeight + Constants.answersGap
                    delta = Constants.separatorAndAnswerGap + firstViewOffset
                } else {
                    delta = Constants.separatorAndAnswerGap
                    firstAnswerViewHeight = answerView.frame.height
                }

                answerView.snp.remakeConstraints {
                    $0.trailing.equalToSuperview().offset(-16)
                    $0.leading.equalToSuperview().offset(16)
                    $0.top.equalTo(separator).offset(delta)
                }
            }
        }
        
        let block = {
            self.scrollView.contentOffset = .zero
            self.view.layoutIfNeeded()
        }
        
        if animated {
            UIView.animate(withDuration: 0.25, animations: block)
        } else {
            block()
        }
        view.setNeedsLayout()
    }
//
//    func addBottom() {
//        answerViews[3].snp.makeConstraints {
//            let offset = -Constants.separatorAndAnswerGap
//            $0.bottom.greaterThanOrEqualTo(scrollContentView.snp.bottom).offset(offset)
//        }
//    }
//
    
    func getWrongAndCorrectAnswersView(appearance: RuleAppearance)
        -> (correct: AnswerView, wrong: AnswerView?) {
            switch appearance {
            case .correctAnswer(let index):
                return (answerViews[index], nil)
            case .wrongAnswer(let correctIndex, let wrongIndex):
                return (answerViews[correctIndex], answerViews[wrongIndex])
            }
    }
    
    func configureViews() {
        view.backgroundColor = .dark
        
        configureScrollView()
        configureProgressView()
        configureChooseAnswerLabel()
        configureRuleQuestionLabel()
        configureSeparator()
        configureAnswerLabels()
    }
    
    func configureScrollView() {
        scrollView = UIScrollView(frame: .zero)
        view.addSubview(scrollView)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollContentView = UIView(frame: .zero)
        scrollView.addSubview(scrollContentView)
        scrollContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view.snp.width)
            $0.height.equalTo(UIScreen.main.bounds.height)
        }
    }
    
    func configureProgressView() {
        progressView = ProgressView(frame: .zero)
        scrollContentView.addSubview(progressView)
        progressView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(69)
            $0.height.equalTo(progressView.progressGradientViewHeight)
        }
        progressView.set(progress: 0.5, animated: true)
    }
    
    func configureChooseAnswerLabel() {
        chooseAnswerLabel = UILabel(frame: .zero)
        chooseAnswerLabel.font = .textStyle21
        chooseAnswerLabel.textAlignment = .center
        chooseAnswerLabel.textColor = .white
        chooseAnswerLabel.numberOfLines = 0
        chooseAnswerLabel.text = "Выберите правильное суждение"
        scrollContentView.addSubview(chooseAnswerLabel)
        chooseAnswerLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(progressView.snp.bottom).offset(20)
            $0.height.equalTo(18)
        }
    }
    
    func configureRuleQuestionLabel() {
        ruleQuestionLabel = UILabel(frame: .zero)
        ruleQuestionLabel.textAlignment = .center
        ruleQuestionLabel.textColor = .white
        ruleQuestionLabel.font = .textStyle2
        ruleQuestionLabel.numberOfLines = 0
        ruleQuestionLabel.preferredMaxLayoutWidth = view.frame.width - 32
        scrollContentView.addSubview(ruleQuestionLabel)
        ruleQuestionLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(chooseAnswerLabel.snp.bottom).offset(12)
        }
    }
    
    func configureSeparator() {
        separator = UIView(frame: .zero)
        separator.backgroundColor = .purpley
        separator.alpha = 0.15
        separator.clipsToBounds = true
        separator.layer.cornerRadius = 2
        scrollContentView.addSubview(separator)
        separator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(89)
            $0.top.equalTo(ruleQuestionLabel.snp.bottom).offset(12)
            $0.height.equalTo(4)
        }
    }
    
    func configureAnswerLabels() {
        for index in 0..<4 {
            let answerView = AnswerView(frame: .zero)
            scrollContentView.addSubview(answerView)
            let gesture = UITapGestureRecognizer(target: self, action: #selector(answerLabelTap(_:)))
            answerView.addGestureRecognizer(gesture)
            answerView.snp.makeConstraints {
                $0.trailing.equalToSuperview().offset(-16)
                $0.leading.equalToSuperview().offset(16)
                if index == 0 {
                    $0.top.equalTo(separator.snp.bottom).offset(Constants.separatorAndAnswerGap)
                } else {
                    $0.top.equalTo(answerViews[index-1].snp.bottom).offset(12)
                }
            }
            answerViews.append(answerView)
        }
    }

    func setAlphaToDissappearingAnswerViews(alpha: CGFloat) {
        for (index, animation) in answersAnimation.animations.enumerated() where animation == .shouldDissappear {
            answerViews[index].alpha = alpha
        }
    }
    
    func calculateScrollViewContentHeight() {
        guard let lastAnswerView = answerViews.reversed().first(where: { $0.alpha != 0 && !$0.isHidden}) else {
            assertionFailure()
            return
        }
        
        let bottomInset: CGFloat = questionState == .answered ? ExerciseModuleConstants.collapsedDrawerHeight : 0
        var contentHeight = lastAnswerView.frame.maxY + Constants.backdropAndAnswerGap + bottomInset
        contentHeight = max(view.frame.height, contentHeight)
        scrollView.contentSize.height = contentHeight
        scrollContentView.snp.updateConstraints {
            $0.height.equalTo(contentHeight)
        }
        print("contentHeight \(contentHeight)")
    }
}

extension ExerciseViewController: PulleyDrawerViewControllerDelegate {
    
    // MARK: - PulleyDelegate
    
    func drawerPositionDidChange(drawer: PulleyViewController, bottomSafeArea: CGFloat) {
        if drawer.drawerPosition == .collapsed {
            calculateScrollViewContentHeight()
        }
    }
    func drawerChangedDistanceFromBottom(drawer: PulleyViewController, distance: CGFloat, bottomSafeArea: CGFloat) {
       
    }
}
