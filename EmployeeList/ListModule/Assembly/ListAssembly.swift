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
        let displayDataManager = ListDisplayDataManager()
        let presenter = ListPresenter()
        let interactor = ListInteractor(employeeService: EmployeeServiceImplementation())
        let router = ListRouter()
        
        viewController.output = presenter
        viewController.displayDataManager = displayDataManager

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return UINavigationController(rootViewController: viewController)
    }
}
