//
//  StatisticView.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/2/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class StatisticView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countLabel.font = UIFont.textStyle16
        countTitleLabel.font = UIFont.textStyle17
        titleLabel.font = UIFont.textStyle20
    }
    
    // MARK: - Public funstions
    
    func configure(count: Int, countTitle: String, title: String) {
        countLabel.text = "\(count)"
        countTitleLabel.text = countTitle
        titleLabel.text = title
    }
}
