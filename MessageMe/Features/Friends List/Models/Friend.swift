//
//  Friend.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit
import Foundation

struct Friend: Codable {
    let firstName, lastName, alias, dateOfBirth: String
    let imageURL: String
    let status: ChatStatus
    var lastSeen: String?
    
    var lastSeenFormated: String {
        get {
            handleLastSeenDisplay()
        }
    }
    
    func handleLastSeenDisplay() -> String {
        
        guard let lastSeen = self.lastSeen else {
            return status.rawValue
        }

        if let lastSeenFormat = lastSeen.numberOfDaysLastOnline() {
            return lastSeenFormat.format(with: "friend.lastseen.message")
        } else {
            return "friend.lastseen.unknown".localized()
        }
        
    }
}
