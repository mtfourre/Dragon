//
//  String+.swift
//  Dragon
//
//  Created by Michael Fourre on 7/19/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

extension String {
    var firstCapitalized: String {
        guard let first = self.characters.first else { return self }
        return String(describing: first).uppercased() + String(self.characters.dropFirst())
    }
    
    var date: Date? {
        guard self.characters.count > 3 else { return nil } //Make sure the string is valid for substring
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return formatter.date(from: self.substring(to: self.index(self.endIndex, offsetBy: -3)))
    }
}

extension String {
    static func *(lhs: String, rhs: Int) -> String {
        return String(repeating: lhs, count: rhs)
    }
    
    static func random(allow format: [RandomStringAllow] = [.numeric, .alphaLower, .alphaUpper, ], length capacity: Int = 64) -> String {
        guard format.count > 0 else {
            preconditionFailure("Random function requires at least one value in array parameter. If no specific value is required, leave the parameter unspecified.")
        }
        
        let set = format.map({ $0.rawValue }).joined().characters
        var characters: [String] = []
        for _ in 0..<capacity {
            let rand = Int(arc4random_uniform(UInt32(set.count % Int(Int32.max))))
            characters.append(String(set[set.index(set.startIndex, offsetBy: rand)]))
        }
        return characters.joined()
    }
}
