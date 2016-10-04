//
//  Fetchable.swift
//  Dragon
//
//  Created by Michael Fourre on 9/19/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation
import CoreData

protocol Fetchable
{
    static var context: NSManagedObjectContext? { get }
}

extension Fetchable where Self: NSManagedObject
{
    static var entityName: String {
        return String(describing: Mirror(reflecting: self).subjectType).components(separatedBy: ".")[0]
    }
    
    internal static func fetch(_ predicate: NSPredicate? = nil) -> [Self]?
    {
        if let request: NSFetchRequest<Self> = Self.fetchRequest() as? NSFetchRequest<Self>
        {
            request.predicate = predicate
            do
            {
                return try self.context?.fetch(request)
            }
            catch let error
            {
                Log.error("\(error)")
            }
        }
        return nil
    }
    
    static func all() -> [Self]?
    {
        if let result = self.fetch()
        {
            return result
        }
        Log.error("No \(self.entityName) found")
        return nil
    }
    
    static func first() -> Self?
    {
        if let result = self.fetch()?[safe: 0]
        {
            return result
        }
        Log.error("No \(self.entityName) found")
        return nil
    }
    
    static func top(_ count: Int = 1) -> [Self]?
    {
        if count > 0, let result = self.fetch(), result.count > 0
        {
            return result
        }
        Log.error("No \(self.entityName) found")
        return nil
    }
    
    static func fromID(_ id: String?) -> Self?
    {
        if let val = id
        {
            return self.fetch(NSPredicate(format: "id == %@", val))?[safe: 0]
        }
        Log.error("No \(self.entityName) found with ID \(id)")
        return nil
    }
}
