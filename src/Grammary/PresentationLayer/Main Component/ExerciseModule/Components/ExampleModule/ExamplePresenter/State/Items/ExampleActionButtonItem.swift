//
//  ExampleActionButtonItem.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 2/10/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit
enum ExampleActionButtonType {
    case reportError, dontWantLearn, alreadyKnow, resetProgress
}

struct ExampleActionButtonItem: TableViewItem {
    
    let type: ExampleActionButtonType
    var tapHandler: CommonBlock?
    
    var title: String {
        switch type {
        case .reportError:
            return "Здесь ошибка"
        case .dontWantLearn:
            return "Не хочу учить"
        case .alreadyKnow:
            return "Уже знаю"
        case .resetProgress:
            return "Сбросить прогресс"
        }
    }
    
    var icon: UIImage {
        switch type {
        case .reportError:
            return Asset.ActionButtons.warningSign.image
        case .dontWantLearn:
            return Asset.ActionButtons.delete.image
        case .alreadyKnow:
            return Asset.ActionButtons.correctSymbol.image
        case .resetProgress:
            return Asset.ActionButtons.refreshButton.image
        }
    }
    
    // MARK: - TableViewItem
    
    static let cellClass: TableViewCellConformable.Type = ExampleActionButtonTableViewCell.self
}
