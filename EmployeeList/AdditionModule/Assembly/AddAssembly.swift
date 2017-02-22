//
//  AdditionAssembly.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class AddAssembly {
    func createAddModule(with listModuleInput: ListModuleInput) -> UIViewController  {
        let navController = AddNavigationController()
        let presenter = AddPresenter()
        
        navController.output = presenter
        
        presenter.view = navController
        presenter.listModuleInput = listModuleInput

        return navController
    }
}
