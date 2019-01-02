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

final class ___VARIABLE_productName:identifier___AssemblyImplTest: XCTestCase {

    let assembly = ___VARIABLE_productName:identifier___AssemblyImpl()

    func testModuleCreation() {
        let controller = assembly.createModule(serviceLocator: ServiceLocator())

        guard let view = controller as? ___VARIABLE_productName:identifier___ViewController else {
            XCTFail("controller should be ___VARIABLE_productName:identifier___ViewController")
            return
        }

        guard let presenter = view.presenter as? ___VARIABLE_productName:identifier___PresenterImpl else {
            XCTFail("presenter should be ___VARIABLE_productName:identifier___PresenterImpl")
            return
        }

        XCTAssert(presenter.router is ___VARIABLE_productName:identifier___RouterImpl, "router should be ___VARIABLE_productName:identifier___RouterImpl")
        XCTAssert(presenter.view is ___VARIABLE_productName:identifier___ViewController, "view should be ___VARIABLE_productName:identifier___ViewController")

        guard let interactor = presenter.interactor as? ___VARIABLE_productName:identifier___InteractorImpl else {
            XCTFail("interactor should be ___VARIABLE_productName:identifier___InteractorImpl")
            return
        }
        XCTAssert(interactor.output is ___VARIABLE_productName:identifier___PresenterImpl, "output should be ___VARIABLE_productName:identifier___PresenterImpl")
    }
}
