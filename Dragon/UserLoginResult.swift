//
//  UserLoginResult.swift
//  Dragon
//
//  Created by Michael Fourre on 6/12/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

class UserLoginResult: APIResult
{
    var userLogin: UserLogin?
    var password: String?
    
    required init(result: Dictionary<String, AnyObject>)
    {
        if let json = result["user_login"] as? Dictionary<String, AnyObject>
        {
            let model = UserLoginAPIModel(json: json)
            self.password = model.password
            self.userLogin = UserLogin.insertOrUpdate(model)
        }
    }
}
