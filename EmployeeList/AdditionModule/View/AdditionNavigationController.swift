//
//  NameViewController.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AddStoryViewOutput: class {
    func viewDidLoadView()
}

protocol AddStoryViewInput: class {

}

class AddStoryViewController: UINavigationController, AddStoryViewInput {
    var output: AddStoryViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        output.viewDidLoadView()
    }
}
