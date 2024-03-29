//
//  ConsumerRequest.swift
//  Dragon
//
//  Created by Michael Fourre on 7/19/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

struct ConsumerRequest: APIRequest {
    typealias APIResultType = ConsumerResult
    var method: String = "consumer/"
    var json: [String:Any] = [:]
    var host: APIHost = .chimera
    
    init(withConsumerID consumerID: String?) {
        self.json["consumer_id"] = consumerID
    }
}
