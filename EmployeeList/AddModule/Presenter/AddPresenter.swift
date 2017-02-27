//
//  AddPresenter.swift
//  EmployeeList
//
//  Created by admin5 on 27.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation

class AddPresenter: AddViewOutput {
    weak var view: AddViewInput!
    
    var didChangeText: ((String) ->Void)!
    var didTapNextButton: (() -> Void)!
    var didTapSaveButton: (() -> Void)!
    
    //MARK : AddViewOutput

    func viewDidEditingChanged(_ text: String) {
        if let didChangeTextBlock = didChangeText {
            print(text)
            didChangeTextBlock(text)
        }
    }
    
    func viewDidTapNextButton() {
        if let didTapNextButtonBlock = didTapNextButton {
            didTapNextButtonBlock()
        }
    }
    
    func viewDidTapSaveButton() {
        if let ddidTapSaveButtonBlock = didTapSaveButton {
            ddidTapSaveButtonBlock()
        }
    }
}
