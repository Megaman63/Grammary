//
//  NotificationTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell, TableViewCell {

    // MARK: - Private properties
    
    private var item: SettingsSwitchItem?
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .dark
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? SettingsSwitchItem else {
            assertionFailure()
            return
        }
        self.item = item
        
        titleLabel.text = item.title
        subtitleLabel.text = item.subTitle
        notificationSwitch.isOn = item.isOn
    }
    
    // MARK: - Actions
    
    @IBAction func didChangeSwitchValue() {
        item?.valueChanged?(notificationSwitch.isOn)
    }
}
