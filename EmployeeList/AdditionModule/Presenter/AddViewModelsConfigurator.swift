//
//  AddViewModelsConfigurator.swift
//  EmployeeList
//
//  Created by admin5 on 22.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct AddViewModel {
    let title: String
    let showsNextButton: Bool
    let didChangeText: (String) -> Void
}

class AddViewModelsConfigurator {
    weak var addPresenter: AddPresenter!
    
    private var viewModels: [AddViewModel]!
    private var currentModelIndex: Int
    
    init(with presenter: AddPresenter) {
        addPresenter = presenter
        currentModelIndex = 0
        viewModels = createViewModels()
    }
    
    func hasNextViewModel() -> Bool {
        return currentModelIndex + 1 <= viewModels.count
    }
    
    func nextViewModel() -> AddViewModel {
        let viewModel = viewModels[currentModelIndex]
        currentModelIndex = currentModelIndex + 1
        return viewModel
    }
    
    //MARK : Helpers
    
    private func createViewModels() -> [AddViewModel] {
        var viewModels: [AddViewModel] = []
        
        let nameViewModel = AddViewModel(title: "Полное имя",
                                         showsNextButton: true) { text in
                                            self.addPresenter.viewDidChangeName(text)
        }
        
        viewModels.append(nameViewModel)
        
        let companyViewModel = AddViewModel(title: "Место работы",
                                            showsNextButton: false) { text in
                                                self.addPresenter.viewDidChangeCompany(text)
        }
        
        viewModels.append(companyViewModel)
        
        return viewModels
    }
}
