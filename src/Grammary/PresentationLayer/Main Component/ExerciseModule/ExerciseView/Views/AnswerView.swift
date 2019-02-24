//
//  AnswerView.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/9/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class AnswerView: UIView {
    
    private enum Constants {
        static let labelInset: CGFloat = 12
    }
    
    // MARK: - Public properties
    
    var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    // MARK: - Private properties
    
    private var label: UILabel = {
        let label = UILabel()
        label.font = .textStyle
        label.textColor = .white
        label.numberOfLines = 0
        label.autoresizingMask = [.flexibleHeight]
        return label
    }()
    
    private lazy var gradientView: GradientView = {
        let gradientView = GradientView(frame: .zero)
        gradientView.isHidden = true
        addSubview(gradientView)
        bringSubviewToFront(label)
        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return gradientView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        clipsToBounds = true
        backgroundColor = .clear
        layer.cornerRadius = 6
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.withAlphaComponent(0.15).cgColor
        addSubview(label)
        label.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(Constants.labelInset)
            $0.bottom.trailing.equalToSuperview().offset(-Constants.labelInset)
        }
    }
    
    // MARK: - Public functions
    
    func showAnswerResult(correctAnswer: Bool, animated: Bool, completion: CommonBlock? = nil) {
        gradientView.alpha = 0
        gradientView.isHidden = false
        
        gradientView.gradientType = correctAnswer ? .green : .red
        
        let block = {
            self.gradientView.alpha = 1
            self.layer.borderWidth = 0
        }
        
        if animated {
            UIView.animate(withDuration: 0.25, animations: block) { _ in
                completion?()
            }
        } else {
            block()
            completion?()
        }
    }
    
    func resetAnswerState() {
        gradientView.alpha = 0
        gradientView.isHidden = true
        layer.borderWidth = 2
    }
}
