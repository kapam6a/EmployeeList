//
//  File.swift
//  EmployeeList
//
//  Created by admin5 on 22.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct EmployeeEntity {
    let name: String
    let company: String
}

protocol EmployeeService {
    func requestEmployeeList(_ completionHandler: ([EmployeeEntity]?, Error?) -> Void)
    func addEmployeeToList(_ employee: EmployeeEntity)
}

class EmployeeServiceImplementation: EmployeeService{
    private var employeeList = [EmployeeEntity(name: "Jenya", company: "Rambler"),
                                EmployeeEntity(name: "Vanya", company: "Tinkoff"),
                                EmployeeEntity(name: "Kolya", company: "Sberbank")]
    
    func requestEmployeeList(_ completionHandler : ([EmployeeEntity]?, Error?) -> Void) {
        completionHandler(employeeList, nil)
    }
    
    func addEmployeeToList(_ employee: EmployeeEntity) {
        employeeList.append(employee)
    }
}
