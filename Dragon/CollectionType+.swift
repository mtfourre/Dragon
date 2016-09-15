//
//  CollectionType+.swift
//  Dragon
//
//  Created by Michael Fourre on 8/2/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

extension CollectionType
{
    subscript (safe index: Index) -> Generator.Element?
    {
        return indices.contains(index) ? self[index] : nil
    }
}