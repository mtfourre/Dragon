//
//  PostPageRequest.swift
//  Dragon
//
//  Created by Michael Fourre on 7/17/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

struct PostPageRequest: APIRequest
{
    var method: String = "post/page/"
    var json: [String:Any] = [:]
    var host: APIHost = .chimera
    
    init(withPageSize size: Int? = 10, usingPostTimestamp time: Date? = nil)
    {
        self.initialize(withJSON: [
            "page_size": size ?? 10,
            "post_time_stamp": time?.toString() ?? "",
        ])
    }
}
