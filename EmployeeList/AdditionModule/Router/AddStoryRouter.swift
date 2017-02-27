//
//  AddRouter.swift
//  EmployeeList
//
//  Created by admin5 on 27.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AddStoryRouterInput {
//    func openNameModule(with didChangeText: @escaping (String) ->Void,
//                           _ didTapNextButton: @escaping () -> Void,
//                           _ didTapSaveButton: @escaping () -> Void)
//    func openCompanyModule(with didChangeText: @escaping (String) ->Void,
//                              _ didTapSaveButton: @escaping () -> Void)
    func openNextModule(with configuration: AddStoryConfiguratoration)
    
    func closeModule()
}

class AddStoryRouter: AddStoryRouterInput {

    weak var viewController: UINavigationController!
    
    //MARK : AddRouterInput
    
//    func openNameModule(with didChangeText: @escaping (String) ->Void,
//                           _ didTapNextButton: @escaping () -> Void,
//                           _ didTapSaveButton: @escaping () -> Void) {
//        let vc = AddNameAssembly().createAddNameModule(with: didChangeText,
//                                                             didTapNextButton,
//                                                             didTapSaveButton)
//        viewController.pushViewController(vc, animated: true)
//    }
//    
//    func openCompanyModule(with didChangeText: @escaping (String) -> Void,
//                              _ didTapSaveButton: @escaping () -> Void) {
//        let vc = AddCompanyAssembly().createAddCompanyModule(with: didChangeText,
//                                                                   didTapSaveButton)
//        
//        viewController.pushViewController(vc, animated: true)
//    }
    func openNextModule(with configuration: AddStoryConfiguratoration) {
        let vc = AddAssembly().createAddModule(with: configuration)
        
        viewController.pushViewController(vc, animated: true)
    }
    
    func closeModule()  {
        viewController.dismiss(animated: true, completion: nil)
    }
}

