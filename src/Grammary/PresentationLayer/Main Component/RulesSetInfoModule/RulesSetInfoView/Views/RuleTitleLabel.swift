//
//  RuleTitleLabel.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/24/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

protocol RuleTitleLabelDelegate: AnyObject {
    func ruleTitleLabelDidChange(label: RuleTitleLabel, frame: CGRect)
}

class RuleTitleLabel: UILabel {
    
    weak var delegate: RuleTitleLabelDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        delegate?.ruleTitleLabelDidChange(label: self, frame: frame)
    }
}
