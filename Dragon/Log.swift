//
//  Log.swift
//  Dragon
//
//  Created by Michael Fourre on 7/15/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

class Log
{
    enum LogType: String
    {
        case debug = "Debug"
        case error = "Error"
        case info = "Info"
        case normal = "Normal"
        case verbose = "Verbose"
        case warning = "Warning"
    }
    
    internal class func position(file: String, function: String, line: Int) -> String
    {
        let path = file.components(separatedBy: "/")
        if let file = path[safe: path.count - 1]?.replacingOccurrences(of: ".swift", with: "")
        {
            return "<\(file):\(line)>"
        }
        return ""
    }
    
    internal class func logFirst(_ type: LogType, file: String, function: String, line: Int, strArr: [String]?)
    {
        if let first = strArr?[safe: 0]
        {
            print("Log.\(type.rawValue)\(position(file: file, function: function, line: line)): \(first)")
        }
        else
        {
            print("Log.\(type.rawValue)\(position(file: file, function: function, line: line)): Could not parse string")
        }
    }
    
    internal class func logRemaining(_ strArr: [String]?)
    {
        if let arr = strArr, arr.count > 1
        {
            for line in arr
            {
                print(line)
            }
        }
    }
    
    internal class func log(type: LogType, string: String?, file: String, function: String, line: Int)
    {
        let strArr = string?.components(separatedBy: "\n")
        self.logFirst(type, file: file, function: function, line: line, strArr: strArr)
        self.logRemaining(strArr)
    }
    
    class func debug(_ string: String?, file: String = #file, function: String = #function, line: Int = #line)
    {
        self.log(type: .debug, string: string, file: file, function: function, line: line)
    }
    
    class func error(_ string: String?, file: String = #file, function: String = #function, line: Int = #line)
    {
        self.log(type: .error, string: string, file: file, function: function, line: line)
    }
    
    class func info(_ string: String?, file: String = #file, function: String = #function, line: Int = #line)
    {
        self.log(type: .info, string: string, file: file, function: function, line: line)
    }
    
    class func normal(_ string: String?, file: String = #file, function: String = #function, line: Int = #line)
    {
        self.log(type: .normal, string: string, file: file, function: function, line: line)
    }
    
    class func verbose(_ string: String?, file: String = #file, function: String = #function, line: Int = #line)
    {
        self.log(type: .verbose, string: string, file: file, function: function, line: line)
    }
    
    class func warning(_ string: String?, file: String = #file, function: String = #function, line: Int = #line)
    {
        self.log(type: .warning, string: string, file: file, function: function, line: line)
    }
}
