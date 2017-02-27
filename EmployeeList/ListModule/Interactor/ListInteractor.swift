//
//  File.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol ListInteractorInput {
    func requestEmployeeList()
    func addNewEmployee(_ employee: EmployeeEntity)
}

protocol ListInteractorOutput: class {
    func interactorDidGetEmployeeList(_ employeeList: [EmployeeEntity])
    func interactorDidFailObtainingEmployeeList(_ error: Error)
}

class ListInteractor: ListInteractorInput {
    weak var output: ListInteractorOutput?
    
    private let employeeService: EmployeeService
    
    init(employeeService: EmployeeService) {
        self.employeeService = employeeService
    }
    
    //MARK : ListInteractorInput
    
    func requestEmployeeList() {
        employeeService.requestEmployeeList { (employeeList, error) in
            if let employeeList = employeeList {
                if let listInteractorOutput = output{
                    listInteractorOutput.interactorDidGetEmployeeList(employeeList)
                }
            } else if let error = error {
                if let listInteractorOutput = output{
                    listInteractorOutput.interactorDidFailObtainingEmployeeList(error)
                }
            }
        }
    }
    
    func addNewEmployee(_ employee: EmployeeEntity) {
        employeeService.addEmployeeToList(employee)
    }
}
