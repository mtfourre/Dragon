//
//  TypeHelper.swift
//  Dragon
//
//  Created by Michael Fourre on 12/20/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import CoreData

struct TypeHelper {
    static func type(from property: String?, ofObject object: APIModel) -> String? {
        let children = Mirror(reflecting: object).children
        let expectedChildren = children.filter({ $0.label == property })
        if let child = expectedChildren.first?.value {
            let childType = String(describing: type(of: child))
            return childType.components(separatedBy: "<").last?.components(separatedBy: ">").first
        }
        return nil
    }
    
    static func type(from property: String?, ofObject object: Model) -> NSAttributeType? {
        return object.entity.attributesByName.filter({ $0.key == property }).map({ $0.value }).first?.attributeType
    }
}
