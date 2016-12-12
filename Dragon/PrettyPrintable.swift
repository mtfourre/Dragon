//
//  PrettyPrintable.swift
//  Dragon
//
//  Created by Michael Fourre on 9/15/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation
import CoreData

protocol PrettyPrintable
{
    func value(forKey key: String) -> Any?
}

extension PrettyPrintable
{
    func getProperties() -> [String]
    {
        if let context = self as? NSManagedObject
        {
            return context.entity.attributesByName.map { $0.key }
        }
        else
        {
            return Mirror(reflecting: self).children.filter { $0.label != nil }.map { $0.label! }
        }
    }
    
    func getPropertiesString(_ context: PrettyPrintable, depth: Int = 0, nameless: Bool = false) -> String
    {
        var string: String = (depth == 0) ? "\n\n" : ""
        string += nameless ? "{\n" : "\(Mirror(reflecting: self).subjectType): {\n"
        for property in context.getProperties()
        {
            string += context.getPropertyString(context, property: property, depth: depth + 1)
        }
        for _ in 0..<depth
        {
            string += "    "
        }
        string += "}\n"
        return string
    }
    
    fileprivate func getPropertyString(_ context: PrettyPrintable, property: String, string s: String = "", depth d: Int = 0) -> String
    {
        let depth: Int = d
        var string: String = s
        for _ in 0..<depth
        {
            string += "    "
        }
        
        if let newProp = context.value(forKey: property) as? PrettyPrintable
        {
            string += "\(property): \(newProp.getPropertiesString(newProp, depth: depth, nameless: true))"
        }
        else if let arr = context.value(forKey: property) as? [Any]
        {
            if arr.count > 0
            {
                string += "\(property): [\n"
                for element in arr
                {
                    for _ in 0...depth
                    {
                        string += "    "
                    }
                    if let model = element as? PrettyPrintable
                    {
                        string += model.getPropertiesString(model, depth: depth + 1)
                        string.insert(",", at: string.index(before: string.endIndex))
                    }
                    else
                    {
                        string += "\(element),\n"
                    }
                }
                for _ in 0..<depth
                {
                    string += "    "
                }
                string += "],\n"
            }
            else
            {
                string += "\(property): []\n"
            }
        }
        else
        {
            if let value = self.value(forKey: property)
            {
                string += "\(property): \(value),\n"
            }
            else
            {
                string += "\(property): nil,\n"
            }
        }
        return string
    }
}
