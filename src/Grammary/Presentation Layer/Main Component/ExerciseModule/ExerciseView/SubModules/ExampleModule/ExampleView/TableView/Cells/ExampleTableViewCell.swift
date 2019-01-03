//
//  ExampleTableViewCell.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

class ExampleTableViewCell: UITableViewCell, TableViewCell {

    @IBOutlet weak var exampleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - TableViewCell
    
    func configure(item: TableViewItem) {
        guard let item = item as? ExampleItem else {
            assertionFailure()
            return
        }
        
        exampleLabel.text = item.text
    }
}
