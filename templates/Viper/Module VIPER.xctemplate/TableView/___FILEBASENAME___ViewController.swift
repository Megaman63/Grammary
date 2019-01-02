//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ___VARIABLE_productName:identifier___ViewController: UIViewController, ___VARIABLE_productName:identifier___View {

    // MARK: - Private properties

    private var tableViewManager: ___VARIABLE_productName:identifier___TableViewManager!

    // MARK: - Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
        tableViewManager = ___VARIABLE_productName:identifier___TableViewManager(tableView: tableView, delegate: self)
    }

    // MARK: - Actions

    // MARK: - ___VARIABLE_productName:identifier___View

    var presenter: ___VARIABLE_productName:identifier___Presenter?

    func setDataSource(_ dataSource: [<#DataSourceType#>]) {
        tableViewManager.dataSource = dataSource
    }
}

extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___TableViewManagerDelegate {

    // MARK: - ___VARIABLE_productName:identifier___TableViewManagerDelegate
}
