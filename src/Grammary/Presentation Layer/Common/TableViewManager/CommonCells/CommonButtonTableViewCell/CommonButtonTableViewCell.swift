//
//  CommonButtonTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class CommonButtonTableViewCell: UITableViewCell, TableViewCell {

    // MARK: - Private properties
    
    private var item: CommonButtonItem!
    
    // MARK: - Outlets
    
    @IBOutlet weak var button: UIButton!
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Actions
    
    @IBAction func buttonTap(_ sender: UIButton) {
        item.tapHandler?()
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? CommonButtonItem else {
            assertionFailure()
            return
        }
        self.item = item
        button.setTitle(item.name, for: .normal)
    }
}
