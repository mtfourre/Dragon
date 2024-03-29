//
//  Loggable.swift
//  Dragon
//
//  Created by Michael Fourre on 2/4/17.
//  Copyright © 2017 MealSloth. All rights reserved.
//

protocol Loggable {
    
}

extension Loggable {
    fileprivate static func position(file: String, function: String, line: Int) -> String {
        let path = file.components(separatedBy: "/")
        if let file = path[safe: path.count - 1]?.replacingOccurrences(of: ".swift", with: "") {
            return "<\(file):\(line)>"
        }
        return ""
    }
    
    fileprivate static func logFirst(_ type: String, file: String, function: String, line: Int, strArr: [String]?) {
        print("Log.\(type)\(position(file: file, function: function, line: line)): \(strArr?.first ?? "Could not parse string")")
    }
    
    fileprivate static func logRemaining(_ strArr: [String]?) {
        strArr?.dropFirst().forEach({ print($0) })
    }
    
    static func log(type: String, string: String?, file: String, function: String, line: Int) {
        let strArr = string?.components(separatedBy: "\n")
        self.logFirst(type, file: file, function: function, line: line, strArr: strArr)
        self.logRemaining(strArr)
    }
}
