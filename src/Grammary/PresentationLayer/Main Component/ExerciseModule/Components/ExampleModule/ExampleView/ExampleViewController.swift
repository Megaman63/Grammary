//
//  ExampleViewImpl.swift
//  Grammary
//
//  Created Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit
import SnapKit

final class ExampleViewController: UIViewController, ExampleView {

    enum Constants {
        static let collapsedDrawerHeight: CGFloat = 70
        static let nextButtonHeight: CGFloat = 44
        static let tableViewBottomContentInset: CGFloat = nextButtonHeight + 20
    }
    
    // MARK: - Private properties

    private var partialRevealDrawerHeight: CGFloat = 616
    private var tableView: UITableView!
    private var tableViewManager: TableViewManager!
    private var nextButton: NextButton!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configureBackground()
        configureArrowView()
        configreTableView()
        configureNextButton()
    }
    
    // MARK: - Actions
    
    @objc func nextButtonTap(sender: UIButton) {
        presenter?.didTapNextButton()
    }
    
    // MARK: - ExampleView

    var presenter: ExamplePresenter?

    func set(dataSource: [TableViewSection]) {
        tableViewManager.dataSource = dataSource
    }
    
    func set(partialRevealDrawerHeight: CGFloat) {
        self.partialRevealDrawerHeight = partialRevealDrawerHeight
    }
    
    // MARK: - Private functions
    
    private func configureArrowView() {
        let arrow = UIImageView(image: Asset.sortDown.image)
        view.addSubview(arrow)
        arrow.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(8)
            $0.top.equalToSuperview().offset(12)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configreTableView() {
        tableView = UITableView(frame: .zero)
        
        view.addSubview(tableView)
        
        tableView.backgroundColor = .clear
        tableView.registerWithNib(cellClass: ExampleHeaderTableViewCell.self)
        tableView.registerWithNib(cellClass: ExampleTableViewCell.self)
        tableView.registerWithNib(cellClass: ExampleActionButtonTableViewCell.self)
        tableView.allowsSelection = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Constants.tableViewBottomContentInset, right: 0)
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.bottom.left.right.equalToSuperview()
        }
        
        tableViewManager = TableViewManager(tableView: tableView, options: .withoutBottomSeparators)
    }
    
    private func configureBackground() {
        let background = GradientView()
        background.bottomColor = .frenchBlue
        background.topColor = .purpley
        view.addSubview(background)
        background.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func configureNextButton() {
        nextButton = NextButton(frame: .zero)
        nextButton.addTarget(self, action: #selector(nextButtonTap(sender:)))
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(Constants.nextButtonHeight)
        }
    }
}

extension ExampleViewController: PulleyDrawerViewControllerDelegate {
    
    // MARK: - PulleyDelegate
    
    func drawerChangedDistanceFromBottom(drawer: PulleyViewController, distance: CGFloat, bottomSafeArea: CGFloat) {
        let offset = view.frame.height - distance
        nextButton?.snp.updateConstraints {
            $0.bottom.equalTo(-offset)
        }
    }
    
    func partialRevealDrawerHeight(bottomSafeArea: CGFloat) -> CGFloat {
        if partialRevealDrawerHeight < Constants.collapsedDrawerHeight {
            
        }
        return max(Constants.collapsedDrawerHeight, partialRevealDrawerHeight)
    }
    
    func collapsedDrawerHeight(bottomSafeArea: CGFloat) -> CGFloat {
        return Constants.collapsedDrawerHeight
    }
}
