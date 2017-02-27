//
//  Router.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol ListRouterInput {
    func openAddModule()
}

class ListRouter: ListRouterInput {
    weak var viewController: UIViewController!
    
    func openAddModule() {
        let newViewController = AddStoryAssembly().createAddStoryModule()
        
        viewController.present(newViewController, animated: true, completion: nil)
    }

}

