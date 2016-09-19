//
//  FieldNameHelper.swift
//  Dragon
//
//  Created by Michael Fourre on 5/3/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

import Foundation

class FieldNameHelper
{
    class func getClientName(forServerName serverName: String) -> String
    {
        var clientName: String = ""
        
        if (serverName == "id")
        {
            return serverName
        }
        else if (serverName.containsString("_id"))
        {
            clientName += self.getClientName(forSubstring: serverName.substringWithRange(serverName.startIndex...serverName.endIndex.advancedBy(-3)))
            clientName += "ID"
        }
        else
        {
            clientName = self.getClientName(forSubstring: serverName)
        }
        
        return clientName
    }
    
    class func getServerName(forClientName clientName: String) -> String
    {
        var serverName: String = ""
        
        if (clientName == "ID")
        {
            return "id"
        }
        else if (clientName.containsString("ID"))
        {
            serverName += self.getServerName(forSubstring: clientName.substringWithRange(clientName.startIndex...clientName.endIndex.advancedBy(-3)))
            serverName += "_id"
        }
        else
        {
            serverName = self.getServerName(forSubstring: clientName)
        }
        
        return serverName
    }
    
    private class func getClientName(forSubstring substring: String) -> String
    {
        var clientName: String  = ""
        var wasUnderscore: Bool = false
        
        for character in substring.characters
        {
            let cs: String = String(character)
            if (cs != "_")
            {
                if (wasUnderscore == false)
                {
                    clientName += cs
                }
                else
                {
                    wasUnderscore = false
                    clientName += cs.uppercaseString
                }
            }
            else
            {
                wasUnderscore = true
            }
        }
        
        return clientName
    }
    
    private class func getServerName(forSubstring substring: String) -> String
    {
        var serverName: String = ""
        
        for character in substring.characters
        {
            let cs: String = String(character)
            if (cs.uppercaseString != cs)
            {
                serverName += cs
            }
            else
            {
                serverName += "_"
                serverName += cs.lowercaseString
            }
        }
        
        return serverName
    }
}
