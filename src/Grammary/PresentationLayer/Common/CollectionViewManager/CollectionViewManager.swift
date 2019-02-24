//
//  CollectionViewManager.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/23/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

struct CollectionViewManagerOptions: OptionSet {
    let rawValue: Int
}

final class CollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private weak var collectionView: UICollectionView?
    
    var dataSource: [CollectionViewSection] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    init(collectionView: UICollectionView,
         options: CollectionViewManagerOptions = []) {
        
        self.collectionView = collectionView
        
        super.init()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSource[indexPath.section].items[indexPath.row]
        return collectionView.dequeueAndConfigureCollectionViewCell(forItem: item, indexPath: indexPath)
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataSource[indexPath.section].didSelectItem?(indexPath.row)
    }
}
