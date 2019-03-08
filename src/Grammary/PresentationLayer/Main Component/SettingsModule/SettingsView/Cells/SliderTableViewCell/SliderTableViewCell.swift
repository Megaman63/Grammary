//
//  SliderTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell, TableViewCell {

    // MARK: - Private properties
    
    private var item: SettingsSliderItem?
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var indicatorLabel: UILabel!
    @IBOutlet weak var indicatorLabelCenterX: NSLayoutConstraint!
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .dark
        slider.setThumbImage(Asset.group3.image, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustIndicatorLabelCenterX()
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? SettingsSliderItem else {
            assertionFailure()
            return
        }
        self.item = item
        titleLabel.text = item.title
        slider.minimumValue = Float(item.minValue)
        slider.maximumValue = Float(item.maxValue)
        slider.value = Float(item.currentValue)
        indicatorLabel.text = "\(item.currentValue)"
        adjustIndicatorLabelCenterX()
    }
    
    // MARK: - Actions
    
    @IBAction func didChangeSliderValue() {
        let currentValue = Int(slider.value)
        item?.valueChanged?(currentValue)
        indicatorLabel.text = "\(currentValue)"
        adjustIndicatorLabelCenterX()
    }
    
    // MARK: - Private functions
    
    private func adjustIndicatorLabelCenterX() {
        let thumb = slider
            .subviews
            .compactMap { $0 as? UIImageView }
            .first(where: { $0.image == Asset.group3.image })
        guard let thumbFrame = thumb?.globalFrame else {
            return
        }

        indicatorLabelCenterX.constant = thumbFrame.midX - contentView.frame.width/2
    }
}
