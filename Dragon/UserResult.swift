//
//  UserResult.swift
//  Dragon
//
//  Created by Michael Fourre on 5/4/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

class UserResult: APIResult
{
    var user: User?
    
    required init(result: Dictionary<String, AnyObject>)
    {
        if let json = result["user"] as? Dictionary<String, AnyObject>
        {
            self.user = User.insertOrUpdate(UserAPIModel(json: json))
        }
    }
}
