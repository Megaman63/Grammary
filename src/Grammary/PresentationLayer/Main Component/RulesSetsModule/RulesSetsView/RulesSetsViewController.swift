//
//  RulesSetsViewController.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetsViewController: UIViewController, RulesSetsView {

    // MARK: - Private properties

    private var tableViewManager: TableViewManager!

    // MARK: - Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
        tableViewManager = TableViewManager(tableView: tableView, options: .withoutBottomSeparators)
        tableView.registerWithNib(cellClass: RulesSetTableViewCell.self)
        presenter?.didTriggerViewReadyEvent() 
    }

    // MARK: - Actions

    // MARK: - RulesSetsView

    var presenter: RulesSetsPresenter?

    func set(dataSource: [TableViewSection]) {
        tableViewManager.dataSource = dataSource
    }
}
