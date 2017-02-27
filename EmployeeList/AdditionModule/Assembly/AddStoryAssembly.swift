//
//  AdditionAssembly.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class AddStoryAssembly {
    func createAddStoryModule() -> UIViewController  {
        let viewController = AddStoryViewController()
        let presenter = AddStoryPresenter()
        let interactor = AddStoryInteractor(employeeService: EmployeeServiceImplementation.sharedInstance)
        let router = AddStoryRouter()
        
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = viewController

        return viewController
    }
}
