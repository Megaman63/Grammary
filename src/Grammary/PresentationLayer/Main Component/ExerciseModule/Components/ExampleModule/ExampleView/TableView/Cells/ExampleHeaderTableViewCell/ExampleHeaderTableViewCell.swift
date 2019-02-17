//
//  ExampleHeaderTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/10/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class ExampleHeaderTableViewCell: UITableViewCell, TableViewCell {
    
    @IBOutlet weak var exampleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        exampleLabel.textColor = .white
        exampleLabel.font = .textStyle22
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? ExampleHeaderItem else {
            assertionFailure()
            return
        }
        
        exampleLabel.text = item.caption
    }
}
