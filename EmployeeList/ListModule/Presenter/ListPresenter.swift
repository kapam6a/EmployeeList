//
//  File.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

protocol ListModuleInput: class {
    func listModuleDidAddNewEmployee(_ employee: EmployeeEntity)
}

class ListPresenter: ListViewOutput, ListInteractorOutput, ListModuleInput {
    weak var view: ListViewInput!
    var interactor: ListInteractorInput!
    var router: ListRouterInput!
    
    private let modelsConverter: ListModelsConverter
    
    init() {
        modelsConverter = ListModelsConverter()
    }
    
    //MARK : ViewOutput
    
    func viewDidBecomeReadyView(){
        interactor.requestEmployeeList()
    }
    
    func viewDidTapAddButton() {
        router.openAdditionModule(with: self)
    }
    
    //MARK : InteractorOutput
    
    func interactorDidGetEmployeeList(_ employeeList: [EmployeeEntity]) {
        let cellModels = modelsConverter.convertModels(employeeList)
        view.updateStateWithModels(cellModels)
    }
    
    func interactorDidCompleteEmployeeListRequestWithError(_ error: Error) {
        view.updateFailureStateWithError(error.localizedDescription)
    }
    
    //MARK : ListModuleInput
    
    func listModuleDidAddNewEmployee(_ employee: EmployeeEntity) {
        interactor.addNewEmployee(employee)
    }
}
