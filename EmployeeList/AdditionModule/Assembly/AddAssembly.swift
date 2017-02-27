//
//  AdditionAssembly.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class AddAssembly {
    func createAddModule() -> UIViewController  {
        let navController = AddNavigationController()
        let presenter = AddPresenter()
        let interactor = AddInteractor(employeeService: EmployeeServiceImplementation.sharedInstance)
        
        navController.output = presenter
        
        presenter.view = navController
        presenter.interactor = interactor
        
        interactor.output = presenter

        return navController
    }
}
