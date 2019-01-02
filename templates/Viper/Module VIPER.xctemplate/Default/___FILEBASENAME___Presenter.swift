//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ___VARIABLE_productName:identifier___PresenterImpl: ___VARIABLE_productName:identifier___Presenter {

    weak var view: ___VARIABLE_productName:identifier___View?
    var interactor: ___VARIABLE_productName:identifier___Interactor
    let router: ___VARIABLE_productName:identifier___Router

    // MARK: - State

    var state: ___VARIABLE_productName:identifier___State

    // MARK: - Init

    init(view: ___VARIABLE_productName:identifier___View,
         interactor: ___VARIABLE_productName:identifier___Interactor,
         router: ___VARIABLE_productName:identifier___Router,
         state: ___VARIABLE_productName:identifier___State) {

        self.view = view
        self.interactor = interactor
        self.router = router
        self.state = state
    }

    // MARK: - ___VARIABLE_productName:identifier___Presenter

}
