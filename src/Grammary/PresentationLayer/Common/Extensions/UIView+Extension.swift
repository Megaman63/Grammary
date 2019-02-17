//
//  UIView+Extension.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/3/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import UIKit

extension UIView {
    static func fromNib<T: UIView>() -> T {
        let nibName = String(describing: T.self)
        guard let view = Bundle.main.loadNibNamed(nibName,
                                                  owner: nil,
                                                  options: nil)?.first as? T
            else {
                fatalError("Cannot load view \(nibName) from nib")
        }
        return view
    }
}
