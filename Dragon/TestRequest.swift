//
//  TestRequest.swift
//  Dragon
//
//  Created by Michael Fourre on 12/12/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

struct TestRequest: APIRequest
{
    var host: APIHost = .chimera
    var json: [String:Any] = [:]
    var method: String = "test/"
    
    init()
    {
        self.initialize(withJSON: [
            "ayy": "lmao",
        ])
    }
}
