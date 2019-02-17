//
//  SettingsViewController.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController, SettingsView {

    // MARK: - Private properties

    private var tableViewManager: TableViewManager!
    
    // MARK: - Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewManager = TableViewManager(tableView: tableView, options: .withoutBottomSeparators)
        tableView.registerWithNib(cellClass: CommonButtonTableViewCell.self)
        presenter?.didTriggerViewReadyEvent()
    }
    
    // MARK: - Actions
    
    // MARK: - SettingsView
    
    var presenter: SettingsPresenter?
    
    func set(dataSource: [TableViewSection]) {
        tableViewManager.dataSource = dataSource
    }
}
