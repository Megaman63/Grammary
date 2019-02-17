//
//  ExampleActionButtonTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/10/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class ExampleActionButtonTableViewCell: UITableViewCell, TableViewCell {

    // MARK: - Private properties
    
    private var item: ExampleActionButtonItem!
    
    // MARK: - Outlets
    
    @IBOutlet weak var button: UIButton!
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.titleLabel?.font = .textStyle7
    }
    
    // MARK: - Actions
    
    @IBAction func buttonTap(_ sender: UIButton) {
        item.tapHandler?()
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? ExampleActionButtonItem else {
            assertionFailure()
            return
        }
        self.item = item
        button.setTitle(item.title, for: .normal)
        button.setImage(item.icon, for: .normal)
    }
}
