//
//  NameTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/8/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell, TableViewCell {
    
    // MARK: - Private properties
    
    private var item: SettingsNameItem?
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .dark
        nameTextField.layer.cornerRadius = 6
        nameTextField.layer.borderColor = UIColor.white.withAlphaComponent(0.15).cgColor
        nameTextField.layer.borderWidth = 2
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? SettingsNameItem else {
            assertionFailure()
            return
        }
        self.item = item
        
        nameTextField.text = ""
        nameLabel.text = item.name
    }
    
    // MARK: - Actions
    
    @IBAction func didChangeName() {
        item?.valueChanged?(nameTextField.text ?? "")
        nameLabel.text = nameTextField.text
    }
    
    @IBAction func didBeginEditing() {
        nameLabel.isHidden = true
        iconImageView.isHidden = true
        placeholderLabel.isHidden = true
    }
    
    @IBAction func didEndEditing() {
        nameLabel.isHidden = false
        iconImageView.isHidden = false
        placeholderLabel.isHidden = false
        nameTextField.text = ""
    }
    
    @IBAction func didTapReturnButton() {
        didEndEditing()
        nameTextField.resignFirstResponder()
    }
}
