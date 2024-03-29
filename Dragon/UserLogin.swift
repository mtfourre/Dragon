//
//  UserLogin.swift
//  Dragon
//
//  Created by Michael Fourre on 9/7/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

class UserLogin: Model {
    @NSManaged var id: String!
    @NSManaged var userID: String!
    @NSManaged var username: String!
    @NSManaged var accessLevel: NSNumber!
}

extension UserLogin {
    var access: UserLoginAccessLevel? {
        get { return UserLoginAccessLevel(rawValue: self.accessLevel.intValue) }
        set { if let value = newValue?.rawValue { self.accessLevel = NSNumber(value: value) } }
    }
    
    var user: User? {
        return User.fromID(self.userID)
    }
}
