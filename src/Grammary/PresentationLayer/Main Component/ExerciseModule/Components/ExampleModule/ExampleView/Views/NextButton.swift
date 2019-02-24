//
//  NextButton.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/10/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class NextButton: UIView {
    
    private enum Constant {
        static let corners: UIRectCorner = [.topRight, .topLeft]
        static let radius: CGFloat = 30
    }
    
    // MARK: - Privat properties
    
    private var corners: UIRectCorner = UIRectCorner.allCorners
    var radius: CGFloat = 0
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        clipsToBounds = true

        let gradientView = GradientView(frame: .zero)
        gradientView.gradientType = .button
        addSubview(gradientView)
        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let label = UILabel()
        label.text = "Продолжить"
        label.font = .textStyle
        label.textColor = .darkTwo
        addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        round(corners: Constant.corners, radius: Constant.radius)
    }
    
    // MARK: - Public functions
    
    func addTarget(_ target: Any?, action: Selector) {
        let gesture = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(gesture)
    }
    
    func round(corners: UIRectCorner, radius: CGFloat) {
        self.corners = corners
        self.radius = radius
        
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.mask = nil
        round(corners: corners, radius: radius)
    }
}
