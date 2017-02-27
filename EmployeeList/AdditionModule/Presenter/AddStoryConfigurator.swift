//
//  AddStoryConfigurator.swift
//  EmployeeList
//
//  Created by admin5 on 27.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

struct AddStoryConfiguratoration {
    let didChangeText: ((String) ->Void)
    let didTapNextButton: (() -> Void)
    let didTapSaveButton: (() -> Void)
    let title: String
    let showsNextButton: Bool
}

class AddStoryConfigurator {
    private weak var presenter:AddStoryPresenter!
    
    init(with presenter: AddStoryPresenter) {
        self.presenter = presenter
    }
    
    func nameModuleConfiguratoration () -> AddStoryConfiguratoration {
        return AddStoryConfiguratoration(didChangeText: { [unowned self] name in
            self.presenter.didChangeName(name)
            },
                                         didTapNextButton: {[unowned self] in
                                            self.presenter.didTapNameModuleNextButton()},
                                         didTapSaveButton: { [unowned self] in
                                            self.presenter.didTapSaveButton()
            },
                                         title: "Полное имя",
                                         showsNextButton: true)
    }
    
    func companyModuleConfiguratoration () -> AddStoryConfiguratoration {
        return AddStoryConfiguratoration(didChangeText: { [unowned self] company in
            self.presenter.didChangeCompany(company)
            },
                                         didTapNextButton: {},
                                         didTapSaveButton: { [unowned self] in
                                            self.presenter.didTapSaveButton()
            },
                                         title: "Компания",
                                         showsNextButton: false)
    }
}
