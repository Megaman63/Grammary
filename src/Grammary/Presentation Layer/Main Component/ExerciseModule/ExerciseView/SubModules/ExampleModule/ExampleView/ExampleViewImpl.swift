//
//  ExampleViewImpl.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit
import SnapKit

final class ExampleViewImpl: UIView, ExampleView {

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        addSubview(tableView)
        
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 236, left: 0, bottom: 0, right: 0)
        tableView.registerWithNib(cellClass: ExampleTableViewCell.self)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        return tableView
    }()
    
    private lazy var tableViewManager: TableViewManager = {
        let tableViewManager = TableViewManager(tableView: tableView, options: .withoutBottomSeparators)
        return tableViewManager
    }()
    
    // MARK: - ExampleView

    var presenter: ExamplePresenter?

    func setDataSource(_ dataSource: [TableViewSection]) {
        tableViewManager.dataSource = dataSource
    }
}
