//
//  ProfressView.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/8/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    enum Constants {
        static let progressGradientViewHeight: CGFloat = 8
        static let stripViewHeight: CGFloat = 4
        static let fullAnimationDuration = 1.0
    }
    
    // MARK: - Public properties
    
   private(set) var progress: CGFloat = 0 {
        didSet {
            assert(progress >= 0 && progress <= 1, "Invalid progress")
        }
    }
    
    // MARK: - Private properties
    
    private var progressGradientView: GradientView = {
        let view = GradientView()
        view.topColor = .frenchBlue
        view.bottomColor = .purpley
        view.cornerRadius = Constants.progressGradientViewHeight/2
        return view
    }()
    
    private var stripView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkTwo
        view.clipsToBounds = true
        view.layer.cornerRadius = Constants.stripViewHeight/2
        return view
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
        addSubview(stripView)
        addSubview(progressGradientView)
    }
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        progressGradientView.frame = CGRect(x: 0,
                                            y: frame.height/2 - Constants.progressGradientViewHeight / 2,
                                            width: frame.width * progress,
                                            height: Constants.progressGradientViewHeight)
        
        stripView.frame = CGRect(x: 0,
                                 y: frame.height/2 - Constants.stripViewHeight / 2,
                                 width: frame.width,
                                 height: Constants.stripViewHeight)
    }
    
    // MARK: - Public funstions
    
    func set(progress: CGFloat, animated: Bool) {
        let progressDelta = abs(self.progress - progress)
        self.progress = progress
        
        let animations = {
            self.layoutIfNeeded()
        }
        
        if animated {
            let duration = Double(progressDelta) * Constants.fullAnimationDuration
            UIView.animate(withDuration: duration, animations: animations)
        } else {
            animations()
        }
    }
}
