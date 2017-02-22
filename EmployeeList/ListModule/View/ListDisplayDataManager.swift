//
//  DisplayDataManager.swift
//  EmployeeList
//
//  Created by admin5 on 21.02.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

struct CellModel {
    let name: String
    let company: String
}

class ListDisplayDataManager:NSObject, UITableViewDelegate, UITableViewDataSource {
    var cellModels: [CellModel] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) {
            cell = UITableViewCell(style:.value1, reuseIdentifier:"cell")
        }
        let cellModel = cellModels[indexPath.row]
        cell?.textLabel?.text = cellModel.name
        cell?.detailTextLabel?.text = cellModel.company
        
        return cell!
    }
}
