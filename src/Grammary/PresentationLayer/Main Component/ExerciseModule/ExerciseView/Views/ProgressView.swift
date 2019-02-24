//
//  ProfressView.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/8/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    private enum Constants {
        static let fullAnimationDuration = 1.0
    }
    
    // MARK: - Public properties
    
   private(set) var progress: CGFloat = 0 {
        didSet {
            assert(progress >= 0 && progress <= 1, "Invalid progress")
        }
    }
    
    var progressGradientViewHeight: CGFloat = 8 {
        didSet {
            progressGradientView.cornerRadius = progressGradientViewHeight/2
            setNeedsLayout()
        }
    }
    
    var stripViewHeight: CGFloat = 4 {
        didSet {
            stripView.layer.cornerRadius = stripViewHeight/2
            setNeedsLayout()
        }
    }
    
    // MARK: - Private properties
    
    private var progressGradientView: GradientView!
    
    private var stripView: UIView!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        stripView = UIView()
        stripView.backgroundColor = .darkTwo
        stripView.clipsToBounds = true
        stripView.layer.cornerRadius = stripViewHeight/2
        addSubview(stripView)
        
        progressGradientView = GradientView()
        progressGradientView.gradientType = .progress
        progressGradientView.cornerRadius = progressGradientViewHeight/2
        addSubview(progressGradientView)
    }
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        let width = max(frame.width * progress, progressGradientViewHeight)
        progressGradientView.frame = CGRect(x: 0,
                                            y: frame.height/2 - progressGradientViewHeight / 2,
                                            width: width,
                                            height: progressGradientViewHeight)
        
        stripView.frame = CGRect(x: 0,
                                 y: frame.height/2 - stripViewHeight / 2,
                                 width: frame.width,
                                 height: stripViewHeight)
    }
    
    // MARK: - Public funstions
    
    func set(progress: CGFloat, animated: Bool) {
        let progressDelta = abs(self.progress - progress)
        self.progress = progress
        setNeedsLayout()
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
