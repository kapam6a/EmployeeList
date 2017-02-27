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

class AddPresenter: AddViewOutput {
    weak var view: AddViewInput!
    weak var listModuleInput: ListModuleInput!
    
    private var newEmployee: AddNewEmployee
    private var configurator: AddViewModelsConfigurator!
    
    init() {
        newEmployee = AddNewEmployee(name: "", company: "")
        configurator = AddViewModelsConfigurator(with: self)
    }
    
    //MARK : AddViewOutput
    
    func viewDidLoadView() {
        if configurator.hasNextViewModel() {
            view.updateWitModel(configurator.nextViewModel())
        }
    }
    
    func viewDidTapNextButton() {
        if configurator.hasNextViewModel() {
            view.updateWitModel(configurator.nextViewModel())
        }
    }
    
    func viewDidTapSaveButton() {
        let employee = EmployeeEntity(name: newEmployee.name,
                                      company: newEmployee.company)
        listModuleInput.listModuleDidAddNewEmployee(employee)
    }
    
    func viewDidChangeName(_ name: String) {
        newEmployee.name = name
    }
    
    func viewDidChangeCompany(_ company: String) {
        newEmployee.company = company
    }
}

