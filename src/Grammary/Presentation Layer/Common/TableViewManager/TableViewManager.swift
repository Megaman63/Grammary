//
//  RulesSetsTableViewManager.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class TableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {

    private weak var tableView: UITableView?

    var dataSource: [TableViewSection] = [] {
        didSet {
            tableView?.reloadData()
        }
    }

    init(tableView: UITableView) {
        self.tableView = tableView

        super.init()

        tableView.delegate = self
        tableView.dataSource = self
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