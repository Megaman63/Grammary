//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import XCTest
@testable import Messenger

final class Mock___VARIABLE_productName:identifier___PresenterImpl: ___VARIABLE_productName:identifier___Presenter, ___VARIABLE_productName:identifier___InteractorOutput {

    weak var view: ___VARIABLE_productName:identifier___View?
    var interactor: ___VARIABLE_productName:identifier___Interactor
    let router: ___VARIABLE_productName:identifier___Router

    init(view: ___VARIABLE_productName:identifier___View,
         interactor: ___VARIABLE_productName:identifier___Interactor,
         router: ___VARIABLE_productName:identifier___Router) {

        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: - ___VARIABLE_productName:identifier___Presenter

    // MARK: - ___VARIABLE_productName:identifier___InteractorOutput
}
