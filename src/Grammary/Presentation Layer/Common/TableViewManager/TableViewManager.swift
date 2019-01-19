//
//  RulesSetsTableViewManager.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct TableViewManagerOptions: OptionSet {
    let rawValue: Int
    
    static let withoutBottomSeparators = TableViewManagerOptions(rawValue: 1 << 0)
}

final class TableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {

    private weak var tableView: UITableView?

    var dataSource: [TableViewSection] = [] {
        didSet {
            tableView?.reloadData()
        }
    }

    init(tableView: UITableView,
         estimatedRowHeight: CGFloat = 44.0,
         rowHeight: CGFloat = UITableView.automaticDimension,
         options: TableViewManagerOptions = []) {
        
        self.tableView = tableView

        super.init()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = estimatedRowHeight
        tableView.rowHeight = rowHeight
        
        if options.contains(.withoutBottomSeparators) {
            tableView.tableFooterView = UIView()
        }
    }

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource[indexPath.section].items[indexPath.row]
        return tableView.dequeueAndConfigureTableViewCell(forItem: item, indexPath: indexPath)
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource[indexPath.section].didSelectItem?(indexPath.row)
    }
}
