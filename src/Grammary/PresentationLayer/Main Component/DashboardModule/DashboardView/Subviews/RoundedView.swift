//
//  RoundedView.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    
    var cornersToRound: UIRectCorner = [] {
        didSet {
            setNeedsLayout()
        }
    }
    var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: cornersToRound, cornerRadii: cornerRadii)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
