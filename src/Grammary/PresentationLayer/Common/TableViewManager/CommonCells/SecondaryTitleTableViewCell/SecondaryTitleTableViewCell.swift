//
//  SecondaryTitleTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 3/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class SecondaryTitleTableViewCell: UITableViewCell, TableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .dark
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? SecondaryTitleItem else {
            assertionFailure()
            return
        }
        titleLabel.text = item.title
    }
}
