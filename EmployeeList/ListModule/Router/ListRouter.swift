//
//  Router.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol ListRouterInput {
    func openAdditionModule(with listModuleInput: ListModuleInput)
}

class ListRouter: ListRouterInput {
    weak var viewController: UIViewController!
    
    func openAdditionModule(with listModuleInput: ListModuleInput) {
        let newViewController = AddAssembly().createAddModule(with: listModuleInput)
        
        viewController.present(newViewController, animated: true, completion: nil)
    }

}

