//
//  RulesSetInfoViewController.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/7/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetInfoViewController: UIViewController, RulesSetInfoView {

    // MARK: - Private properties
    
    private var tableViewManager: TableViewManager!
    
    // MARK: - Outlets
    
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        
        presenter?.didTriggerViewReadyEvent()
    }

    // MARK: - Actions

    // MARK: - RulesSetInfoView

    var presenter: RulesSetInfoPresenter?
    
    func setDataSource(_ dataSource: [TableViewSection]) {
        tableViewManager.dataSource = dataSource
    }
    
    // MARK: - Private functions
    
    private func configureTableView() {
        tableViewManager = TableViewManager(tableView: tableView)
        tableView.registerWithNib(cellClass: RuleProgressTableViewCell.self)
        tableView.registerWithNib(cellClass: RulesSetHeaderTableViewCell.self)
        tableView.tableFooterView = UIView()
    }
}
