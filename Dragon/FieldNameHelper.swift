//
//  FieldNameHelper.swift
//  Dragon
//
//  Created by Michael Fourre on 5/3/16.
//  Copyright © 2016 MealSloth. All rights reserved.
//

struct FieldNameHelper: FieldNameConverter {
    static func getClientName(forServerName serverName: String) -> String {
        guard serverName != "id" else { return serverName }
        if serverName.contains("_id") {
            return "\(self.getClientName(forSubstring: serverName.substring(to: serverName.index(serverName.endIndex, offsetBy: -3))))ID"
        } else {
            return self.getClientName(forSubstring: serverName)
        }
    }
    
    static func getServerName(forClientName clientName: String) -> String {
        guard clientName != "id" else { return clientName }
        if clientName.contains("ID") {
            return "\(self.getServerName(forSubstring: clientName.substring(to: clientName.index(clientName.endIndex, offsetBy: -2))))_id"
        } else {
            return self.getServerName(forSubstring: clientName)
        }
    }
    
    fileprivate static func getClientName(forSubstring substring: String) -> String {
        var clientName = ""
        var wasUnderscore = false
        for cs in substring.characters.map({ String($0) }) {
            guard cs != "_" else {
                wasUnderscore = true
                continue
            }
            clientName += wasUnderscore ? cs.uppercased() : cs
            wasUnderscore = false
        }
        return clientName
    }
    
    fileprivate static func getServerName(forSubstring substring: String) -> String {
        return substring.characters.map({ String($0) }).map({ $0.uppercased() == $0 ? "_\($0.lowercased())" : $0 }).joined()
    }
}
