//
//  EditProfileBirthdayCell.swift
//  Dragon
//
//  Created by Michael Fourre on 1/10/17.
//  Copyright © 2017 MealSloth. All rights reserved.
//

import UIKit

class EditProfileBirthdayCell: EditProfileCell
{
    class func getInstance(from tableView: UITableView, at indexPath: IndexPath, for user: User?) -> UITableViewCell
    {
        return super.getInstance(from: tableView, at: indexPath, ofType: .birthday, for: user)
    }
}
