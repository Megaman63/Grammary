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
        view.backgroundColor = .dark
        
        configureTableView()
        
        presenter?.didTriggerViewReadyEvent()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Actions
    
    @IBAction func backgroudTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    // MARK: - SettingsView
    
    var presenter: SettingsPresenter?
    
    func set(dataSource: [TableViewSection]) {
        tableViewManager.dataSource = dataSource
    }
}

private extension SettingsViewController {
    func configureTableView() {
        tableView.backgroundColor = .dark
        tableView.separatorColor = .clear
        tableViewManager = TableViewManager(tableView: tableView, options: .withoutBottomSeparators)
        tableView.registerWithNib(cellClass: CommonButtonTableViewCell.self)
        tableView.registerWithNib(cellClass: SliderTableViewCell.self)
        tableView.registerWithNib(cellClass: SecondaryTitleTableViewCell.self)
        tableView.registerWithNib(cellClass: NotificationTableViewCell.self)
        tableView.registerWithNib(cellClass: NameTableViewCell.self)
    }
}
