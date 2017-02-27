//
//  AppAssembly.swift
//  EmployeeList
//
//  Created by admin5 on 27.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit
//
//class AddNameAssembly {
//    func createAddNameModule(with didChangeText: @escaping (String) ->Void,
//                                _ didTapNextButton: @escaping () -> Void,
//                                _ didTapSaveButton: @escaping () -> Void) -> UIViewController  {
//        let viewController = AddViewController()
//        let presenter = AddPresenter()
//        
//        viewController.navigationItem.title = "Полное имя"
//        viewController.showsNextButton = true
//        viewController.output = presenter
//        
//        presenter.view = viewController
//        presenter.didChangeText = didChangeText
//        presenter.didTapNextButton = didTapNextButton
//        presenter.didTapSaveButton = didTapSaveButton
//        
//        return viewController
//    }
//}
//
//class AddCompanyAssembly {
//    func createAddCompanyModule(with didChangeText: @escaping (String) ->Void,
//                                   _ didTapSaveButton: @escaping () -> Void) -> UIViewController  {
//        let viewController = AddViewController()
//        let presenter = AddPresenter()
//
//        viewController.navigationItem.title = "Компания"
//        viewController.showsNextButton = false
//        viewController.output = presenter
//        
//        presenter.view = viewController
//        presenter.didChangeText = didChangeText
//        presenter.didTapSaveButton = didTapSaveButton
//        
//        return viewController
//    }
//}

class AddAssembly {
    func createAddModule(with configuration: AddStoryConfiguratoration) -> UIViewController  {
        let viewController = AddViewController()
        let presenter = AddPresenter()
        
        viewController.navigationItem.title = configuration.title
        viewController.showsNextButton = configuration.showsNextButton
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.didChangeText = configuration.didChangeText
        presenter.didTapNextButton = configuration.didTapNextButton
        presenter.didTapSaveButton = configuration.didTapSaveButton
        
        return viewController
    }
}
