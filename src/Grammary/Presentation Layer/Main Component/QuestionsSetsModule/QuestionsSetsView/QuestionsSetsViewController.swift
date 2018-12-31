//
//  QuestionsSetsViewController.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class QuestionsSetsViewController: UIViewController, QuestionsSetsView {

    // MARK: - Private properties

    private var tableViewManager: QuestionsSetsTableViewManager!

    // MARK: - Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
        tableViewManager = QuestionsSetsTableViewManager(tableView: tableView)
    }

    // MARK: - Actions

    // MARK: - QuestionsSetsView

    var presenter: QuestionsSetsPresenter?

    func setDataSource(_ dataSource: [Int]) {
        tableViewManager.dataSource = dataSource
    }
}
