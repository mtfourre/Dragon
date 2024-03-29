//
//  EditProfileTableViewController.swift
//  Dragon
//
//  Created by Michael Fourre on 1/10/17.
//  Copyright © 2017 MealSloth. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController {
    let cells: [EditProfileCell.Type] = [
        EditProfilePhotoCell.self,
        EditProfileBasicCell.self,
        EditProfileBirthdayCell.self,
        EditProfileGenderCell.self,
    ]
    
    var user: User?
    
    // MARK: Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 150
        self.cells.forEach({ self.registerNib(withName: $0.type.name) })
    }
    
    // MARK: TableView Delegates
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0: return 200.0
            case 1: return 100.0
            case 2: return 80.0
            case 3: return 80.0
            default: return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Handle row clicks
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0: return EditProfilePhotoCell.instance(from: tableView, at: indexPath, for: self.user)
            case 1: return EditProfileBasicCell.instance(from: tableView, at: indexPath, for: self.user)
            case 2: return EditProfileBirthdayCell.instance(from: tableView, at: indexPath, for: self.user)
            case 3: return EditProfileGenderCell.instance(from: tableView, at: indexPath, for: self.user)
            default: return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }
}
