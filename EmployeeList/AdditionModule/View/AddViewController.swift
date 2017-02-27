//
//  File.swift
//  EmployeeList
//
//  Created by admin5 on 22.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AddViewOutput: class {
    func viewDidEditingChanged(_ text: String)
    func viewDidTapNextButton()
    func viewDidTapSaveButton()
}

protocol AddViewInput: class {

}

class AddViewController: UIViewController, AddViewInput, UITextFieldDelegate {
    var output: AddViewOutput!
    
    var showsNextButton: Bool
    
    private var textField: UITextField!
    
    //MARK : Life cycle
    
    init() {
        showsNextButton = false
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if showsNextButton {
            let nextButton = UIBarButtonItem(title: "Next",
                                             style: .done,
                                             target: self,
                                             action: #selector(didTapNexButton(_:)))
            navigationItem.leftBarButtonItem = nextButton
        }
       
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                     target: self,
                                     action: #selector(didTapSaveButton(_:)))
        
        navigationItem.rightBarButtonItem = saveButton

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
    
    //MARK : UIControl
    
    @objc private func didEditingChanged(_ textField: UITextField) {
        output.viewDidEditingChanged(textField.text!)
    }
    
    //MARK : Actions
    
    @objc private func didTapNexButton(_ sender: UIBarButtonItem) {
        output.viewDidTapNextButton()
    }
    
    @objc private func didTapSaveButton(_ sender: UIBarButtonItem) {
        output.viewDidTapSaveButton()
    }
    
    //MARK : UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
