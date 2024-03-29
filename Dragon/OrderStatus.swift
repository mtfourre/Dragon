//
//  OrderStatus.swift
//  Dragon
//
//  Created by Michael Fourre on 5/3/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

enum OrderStatus: Int, Enumerable {
    case pending = 0
    case received = 1
    case progress = 2
    case completed = 3
    case shipped = 4
    case delivered = 5
    case disputed = 6
    case cancelled = 7
}
