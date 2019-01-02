//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Router

protocol ___VARIABLE_productName:identifier___Router: AnyObject {
    func dismissView()
}

// MARK: - Presenter

protocol ___VARIABLE_productName:identifier___Presenter: AnyObject {

}

// MARK: - Interactor

protocol ___VARIABLE_productName:identifier___Interactor: AnyObject {

}

// MARK: - InteractorOutput

protocol ___VARIABLE_productName:identifier___InteractorOutput: AnyObject {

}

// MARK: - View

protocol ___VARIABLE_productName:identifier___View: AnyObject {
	var presenter: ___VARIABLE_productName:identifier___Presenter? { get set }
}
