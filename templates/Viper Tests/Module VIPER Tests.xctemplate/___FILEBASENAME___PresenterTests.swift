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

final class ___VARIABLE_productName:identifier___PresenterImplTest: XCTestCase {

    var presenter: ___VARIABLE_productName:identifier___PresenterImpl!

    let view = Mock___VARIABLE_productName:identifier___ViewImpl()
    let interactor = Mock___VARIABLE_productName:identifier___InteractorImpl()
    let router = Mock___VARIABLE_productName:identifier___RouterImpl()

    override func setUp() {
        super.setUp()
        presenter = ___VARIABLE_productName:identifier___PresenterImpl(view: view,
        interactor: interactor,
        router: router)
    }

    func testViewReadyEvent() {

    }
}
