//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_productName:identifier___TableViewManagerDelegate: AnyObject {

}

final class ___VARIABLE_productName:identifier___TableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {

    private weak var tableView: UITableView?
    private weak var delegate: ___VARIABLE_productName:identifier___TableViewManagerDelegate?

    var dataSource: [<#DataSourceType#>] = [] {
        didSet {
            tableView?.reloadData()
        }
    }

    init(tableView: UITableView, delegate: ___VARIABLE_productName:identifier___TableViewManagerDelegate?) {
        self.tableView = tableView
        self.delegate = delegate

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
