//
//  File.swift
//  EmployeeList
//
//  Created by admin5 on 22.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    var didChangeText: ((String) ->Void)!
    
    private var textField: UITextField!
    
    //MARK : Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textField = UITextField(frame: .zero)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.addTarget(self,
                            action: #selector(didEditingChanged(_ :)),
                            for: .editingChanged)
        view.addSubview(textField)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textField.frame = CGRect(x: view.frame.width/2 - 100, y: 100, width: 200, height: 44)
    }
    
    
    @objc private func didEditingChanged(_ textField: UITextField) {
        if let block = didChangeText {
            block(textField.text!)
        }
    }
    
    //MARK : UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
