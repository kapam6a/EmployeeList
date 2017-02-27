//
//  AdditionPresenter.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct AddNewEmployee {
    var name: String
    var company: String
}

class AddStoryPresenter: AddStoryViewOutput, AddStoryInteractorOutput {
    weak var view: AddStoryViewInput!
    var interactor: AddStoryInteractorInput!
    var router: AddStoryRouterInput!
    
    private var newEmployee: AddNewEmployee
    private var configurator: AddStoryConfigurator!
    
    init() {
        newEmployee = AddNewEmployee(name: "", company: "")
        configurator = AddStoryConfigurator(with: self)
    }
    
    //MARK : AddViewOutput
    
    func viewDidLoadView() {
        router.openNextModule(with: configurator.nameModuleConfiguratoration())
    }
    
    func didTapNameModuleNextButton() {
        router.openNextModule(with: configurator.companyModuleConfiguratoration())
    }
    
    func didTapSaveButton() {
        let employee = EmployeeEntity(name: newEmployee.name,
                                      company: newEmployee.company)
        interactor.addNewEmployee(employee)
        router.closeModule()
    }
    
    func didChangeName(_ name: String) {
        newEmployee.name = name
    }
    
    func didChangeCompany(_ company: String) {
        newEmployee.company = company
    }
}

