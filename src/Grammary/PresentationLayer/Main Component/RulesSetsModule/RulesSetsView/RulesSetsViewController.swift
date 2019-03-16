//
//  RulesSetsViewController.swift
//  Grammary
//
//  Created Сергей Гребеножко on 30/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import UIKit

final class RulesSetsViewController: UIViewController, RulesSetsView {

    private enum Constants {
        static let itemsSideMargin: CGFloat = 16
        static let itemsBottomMargin: CGFloat = 80
        static let itemsMinSpace: CGFloat = 17
        static let itemsTopMargin: CGFloat = 31
        static let flowLayoutResistence: CGFloat = 3000
        static let searchTextFieldCornerRadius: CGFloat = 10
        static let filtersViewCornerRadius: CGFloat = 8
    }
    
    // MARK: - Private properties

    private var collectionViewManager: CollectionViewManager!
    private var tabBarHeight: CGFloat = 0
    
    // MARK: - Outlets

    @IBOutlet private weak var searchTextField: TextField!
    @IBOutlet private weak var filtersView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var flowLayout: SpringyFlowLayout!
    @IBOutlet var filterButtons: [UIButton]!
    
    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .dark
        
        configureSearchBar()
        configureFiltersView()
        configureCollectionView()

        presenter?.didTriggerViewReadyEvent() 
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        let bottomSafeAreaPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        tabBarHeight = tabBarController?.tabBar.frame.height ?? 0 + bottomSafeAreaPadding
        flowLayout.sectionInset.bottom = Constants.itemsSideMargin + tabBarHeight
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Actions

    @IBAction func didChangeSearchText(_ sender: Any) {
        presenter?.didChangeSearchText(searchTextField.text ?? "")
    }
    
    @IBAction func didTapFilterButton(_ sender: UIButton) {
        for (index, button) in filterButtons.enumerated() {
            if button === sender {
                presenter?.didSelectFilterAtIndex(index)
                button.backgroundColor = .white
                button.isSelected = true
            } else {
                button.backgroundColor = .clear
                button.isSelected = false
            }
        }
    }
    
    // MARK: - RulesSetsView

    var presenter: RulesSetsPresenter?

    func set(dataSource: [CollectionViewSection]) {
        collectionViewManager.dataSource = dataSource
    }
    
    // MARK: - Private functions
    
    private func configureSearchBar() {
        searchTextField.backgroundColor = .darkTwo
        searchTextField.textColor = .white
        searchTextField.font = .textStyle24
        searchTextField.layer.cornerRadius = Constants.searchTextFieldCornerRadius
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Поиск",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.blueGrey]
        )
    }
    
    private func configureFiltersView() {
        filtersView.layer.cornerRadius = Constants.filtersViewCornerRadius
        filtersView.backgroundColor = .darkTwo
        
        let titles = ["Все", "На изучении", "Не начатые"]
        for (index, button) in filterButtons.enumerated() {
            let normalTitle = NSAttributedString(
                string: titles[index],
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7),
                    NSAttributedString.Key.font: UIFont.textStyle5
                ]
            )
            let selectedTitle = NSAttributedString(
                string: titles[index],
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.darkTwo,
                    NSAttributedString.Key.font: UIFont.textStyle4
                ]
            )
            if index == 0 {
                button.backgroundColor = .white
                button.isSelected = true
            } else {
                button.backgroundColor = .clear
                button.isSelected = false
            }
            
            button.setAttributedTitle(normalTitle, for: .normal)
            button.setAttributedTitle(selectedTitle, for: .selected)
        }
    }
    
    private func configureCollectionView() {
        collectionViewManager = CollectionViewManager(collectionView: collectionView)
        collectionView.registerWithNib(cellClass: RulesSetCollectionViewCell.self)
        collectionView.contentInsetAdjustmentBehavior = .never
        
        var itemWidth = Int((UIScreen.main.bounds.width - 2 * Constants.itemsSideMargin - Constants.itemsMinSpace)/2)
        itemWidth = itemWidth % 2 == 0 ? itemWidth : itemWidth - 1
        flowLayout.kResistence = Constants.flowLayoutResistence
        flowLayout.itemSize = CGSize(width: CGFloat(itemWidth), height: CGFloat(itemWidth))
        flowLayout.sectionInset = UIEdgeInsets(top: Constants.itemsTopMargin,
                                               left: Constants.itemsSideMargin,
                                               bottom: 0,
                                               right: Constants.itemsSideMargin + tabBarHeight)
    }
}

extension RulesSetsViewController: UISearchBarDelegate {
    
    // MARK: - UISearchBarDelegate
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.didChangeSearchText("")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

class PaddingLabel: UILabel {
    
    var padding: UIEdgeInsets = .zero {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    // Override `intrinsicContentSize` property for Auto layout code
    override var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    
    // Override `sizeThatFits(_:)` method for Springs & Struts code
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSizeThatFits = super.sizeThatFits(size)
        let width = superSizeThatFits.width + padding.left + padding.right
        let heigth = superSizeThatFits.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    
}

class TextField: UITextField {
    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0
    
    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
}
