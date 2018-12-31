//
//  QuestionsSetsTableViewManager.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class QuestionsSetsTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {

    private weak var tableView: UITableView?

    var dataSource: [Int] = [] {
        didSet {
            tableView?.reloadData()
        }
    }

    init(tableView: UITableView) {
        self.tableView = tableView

        super.init()

        tableView.delegate = self
        tableView.dataSource = self

        //tableView.registerWithNib(cellClass: <#CellClass#>.self)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = dataSource[indexPath.row]
//        let cell = tableView.dequeue(<#CellClass#>.self, for: indexPath)
//        return cell
        return UITableViewCell()
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
