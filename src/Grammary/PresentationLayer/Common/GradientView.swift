//
//  GradientView.swift
//
//  Created by Mathieu Vandeginste on 06/12/2016.
//  Copyright © 2018 Mathieu Vandeginste. All rights reserved.
//

import UIKit

enum GradientBaseLine {
    case bottomLeftToTopRight
    case leftToRight
}

struct GradientType {
    
    static let button   = GradientType(topColor: .veryLightPink, bottomColor: .paleLilac,   baseLine: .leftToRight)
    static let blueBG   = GradientType(topColor: .purpley,       bottomColor: .frenchBlue,  baseLine: .leftToRight)
    static let progress = GradientType(topColor: .frenchBlue,    bottomColor: .purpley,     baseLine: .leftToRight)
    static let green    = GradientType(topColor: .appleGreen,    bottomColor: .grassyGreen, baseLine: .leftToRight)
    static let red      = GradientType(topColor: .grapefruit,    bottomColor: .orangeRed,   baseLine: .leftToRight)
    static let darkBG   = GradientType(topColor: .grapePurple,   bottomColor: .eggplant,    baseLine: .leftToRight)
    
    static let item0 = GradientType(topColor: .peach,       bottomColor: .pastelRed,      baseLine: .bottomLeftToTopRight)
    static let item1 = GradientType(topColor: .fadedOrange, bottomColor: .lightMustard,   baseLine: .bottomLeftToTopRight)
    static let item2 = GradientType(topColor: .coolBlue,    bottomColor: .lightGreyGreen, baseLine: .bottomLeftToTopRight)
    static let item3 = GradientType(topColor: .dustyTeal,   bottomColor: .blueGreen,      baseLine: .bottomLeftToTopRight)
    static let item4 = GradientType(topColor: .robinSEgg,   bottomColor: .lightUrple,     baseLine: .bottomLeftToTopRight)
    
    static let items = [item0, item1, item2, item3, item4]
    
    let topColor: UIColor
    let bottomColor: UIColor
    let baseLine: GradientBaseLine
}

@IBDesignable class GradientView: UIView {
    
    private var gradientLayer: CAGradientLayer!
    
    var gradientType: GradientType = .blueBG {
        didSet {
            topColor = gradientType.topColor
            bottomColor = gradientType.bottomColor
            
            switch gradientType.baseLine {
            case .bottomLeftToTopRight:
                startPointX = 0
                startPointY = 1
                endPointX = 1
                endPointY = 0
            case .leftToRight:
                startPointX = 0
                startPointY = 0.5
                endPointX = 1
                endPointY = 0.5
            }
        }
    }
    
    @IBInspectable var topColor: UIColor = .red {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = .yellow {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowY: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowBlur: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointX: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        self.gradientLayer = self.layer as? CAGradientLayer
        self.gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        self.gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        self.gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        self.layer.shadowRadius = shadowBlur
        self.layer.shadowOpacity = 1
        
    }
    
    func animate(duration: TimeInterval, newTopColor: UIColor, newBottomColor: UIColor) {
        let fromColors = self.gradientLayer?.colors
        let toColors: [AnyObject] = [ newTopColor.cgColor, newBottomColor.cgColor]
        self.gradientLayer?.colors = toColors
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = duration
        animation.isRemovedOnCompletion = true
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.gradientLayer?.add(animation, forKey:"animateGradient")
    }
}
