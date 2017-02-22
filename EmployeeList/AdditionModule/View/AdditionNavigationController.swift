//
//  NameViewController.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AddViewOutput: class {
    func viewDidLoadView()
    func viewDidChangeName(_ name: String)
    func viewDidChangeCompany(_ company: String)
    func viewDidTapNextButton()
    func viewDidTapSaveButton()
}

protocol AddViewInput: class {
    func updateWitModel(_ viewModel: AddViewModel)
}

class AddNavigationController: UINavigationController, AddViewInput {
    var output: AddViewOutput!
    
    private var nextButton: UIBarButtonItem!
    private var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        
        output.viewDidLoadView()
    }
    
    //MARK : AddViewInput
    
    func updateWitModel(_ viewModel: AddViewModel) {
        let newViewController = viewControllerWithModel(viewModel)
        pushViewController(newViewController, animated: true)
    }
    
    //MARK : Actions
    
    @objc private func didTapNexButton(_ sender: UIBarButtonItem) {
        output.viewDidTapNextButton()
    }
    
    @objc private func didTapSaveButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        output.viewDidTapSaveButton()
    }
    
    //MARK : Helpers
    
    private func viewControllerWithModel(_ viewModel: AddViewModel) -> UIViewController {
        let viewController = AddViewController()
        
        viewController.navigationItem.title = viewModel.title
        if viewModel.showsNextButton == true {
            viewController.navigationItem.setLeftBarButton(nextButton, animated: false)
        } else {
            viewController.navigationItem.setHidesBackButton(true, animated:true);
        }
        viewController.navigationItem.setRightBarButtonItems([saveButton], animated: false)
        viewController.didChangeText = viewModel.didChangeText
        
        return viewController
    }
    
    private func configureButtons() {
        nextButton = UIBarButtonItem(title: "Next",
                                     style: .done,
                                     target: self,
                                     action: #selector(didTapNexButton(_:)))
        
        saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                     target: self,
                                     action: #selector(didTapSaveButton(_:)))
    }
}
