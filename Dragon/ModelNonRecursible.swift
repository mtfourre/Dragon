//
//  ModelNonRecursible.swift
//  Dragon
//
//  Created by Michael Fourre on 12/8/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

protocol ModelNonRecursible: PropertiesAccessible {
    
}

extension ModelNonRecursible where Self: APIModel {
    func initialize<T: FieldNameConverter>(_ json: [String:Any], skip: [String] = [], using: T.Type) {
        for property in self.properties where !skip.contains(property) && !skip.contains(T.getServerName(forClientName: property)) {
            self.set(json[T.getServerName(forClientName: property)], for: property)
        }
    }
}
