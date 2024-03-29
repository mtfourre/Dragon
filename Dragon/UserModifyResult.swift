//
//  UserModifyResult.swift
//  Dragon
//
//  Created by Michael Fourre on 7/26/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

struct UserModifyResult: APIResult {
    var user: User?
    
    init(result: [String:Any]) {
        self.user = User.insert(UserAPIModel(jsonOptional: result["user"] as? [String:Any]))
    }
}
