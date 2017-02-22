//
//  ViewController.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol ListViewOutput {
    func viewDidBecomeReadyView()
    func viewDidTapAddButton()
}

protocol ListViewInput: class {
    func updateStateWithModels(_ cellModels: [CellModel])
    func updateFailureStateWithError(_ error: String)
}

class ListViewController: UIViewController, ListViewInput {
    var output: ListViewOutput!
    var displayDataManager: ListDisplayDataManager!
    
    private var tableView: UITableView!
    private var alertController: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(didTapAddButton(_:)))
        navigationItem.rightBarButtonItem = addButton
        
        alertController = createAlertConroller()
        
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = displayDataManager
        tableView.dataSource = displayDataManager
        view.addSubview(tableView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewDidBecomeReadyView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: ViewInput

    func updateStateWithModels(_ cellModels: [CellModel]) {
        displayDataManager.cellModels = cellModels
        tableView.reloadData()
    }
    
    func updateFailureStateWithError(_ error: String) {
        alertController.title = error
        present(alertController, animated: true, completion: nil)
    }
    //MARK: Actions
    
    @objc private func didTapAddButton(_ sender: UIBarButtonItem) {
        output.viewDidTapAddButton()
    }
    
    //MARK: Helpers
    
    private func createAlertConroller() -> UIAlertController {
        let alertController = UIAlertController(title: "Error",
                                                message: nil,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertActionStyle.default,
                                                handler: nil))
        return alertController
    }
}

