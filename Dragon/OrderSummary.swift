//
//  OrderSummary.swift
//  Dragon
//
//  Created by Michael Fourre on 9/7/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

class OrderSummary: Model {
    @NSManaged var id: String!
    @NSManaged var orderID: String!
    @NSManaged var postID: String!
    @NSManaged var orderStatus: NSNumber!
    @NSManaged var orderType: NSNumber!
    @NSManaged var latestTime: Date!
    
    var status: OrderStatus? {
        get { return OrderStatus(rawValue: self.orderStatus.intValue) }
        set { if let value = newValue?.rawValue { self.orderStatus = NSNumber(value: value) } }
    }
    
    var type: OrderType? {
        get { return OrderType(rawValue: self.orderType.intValue) }
        set { if let value = newValue?.rawValue { self.orderStatus = NSNumber(value: value) } }
    }
}
