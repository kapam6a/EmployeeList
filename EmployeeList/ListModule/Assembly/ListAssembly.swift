//
//  Assembly.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class ListAssembly {
    func createEmployeeListModule() -> UIViewController  {
        let viewController = ListViewController()
        let presenter = ListPresenter()
        let interactor = ListInteractor(employeeService: EmployeeServiceImplementation.sharedInstance)
        let router = ListRouter()
        
        viewController.output = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return UINavigationController(rootViewController: viewController)
    }
}
