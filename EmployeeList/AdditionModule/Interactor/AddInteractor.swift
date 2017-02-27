//
//  AdditionInteractor.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol AddInteractorInput {
    func addNewEmployee(_ employee: EmployeeEntity)
}

protocol AddInteractorOutput: class {
    
}

class AddInteractor: AddInteractorInput {
    weak var output: AddInteractorOutput?
    
    private let employeeService: EmployeeService
    
    init(employeeService: EmployeeService) {
        self.employeeService = employeeService
    }
    
    //MARK : ListInteractorInput
        
    func addNewEmployee(_ employee: EmployeeEntity) {
        employeeService.addEmployeeToList(employee)
    }
}
