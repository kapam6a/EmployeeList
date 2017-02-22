//
//  File.swift
//  EmployeeList
//
//  Created by admin5 on 22.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class ListModelsConverter {
    func convertModels(_ models:[EmployeeEntity]) -> [CellModel] {
        return models.map({employeeEntity -> CellModel in
            return CellModel(name: employeeEntity.name,
                             company: employeeEntity.company)
        })
    }
}
