//
//  OnlineStatus.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/06.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit
import Foundation

enum ChatStatus:String, Codable {

    case Online = "Online"
    case Busy = "Busy"
    case Away = "Away"
    case Offline = "Offline"
    
    func getColor() -> UIColor {
        
        switch self {
        case .Online:
            return "#2ECC71".hexToColor()
        case .Away:
            return "#F39C12".hexToColor()
        case .Busy:
            return "#E74C3C".hexToColor()
        case .Offline:
            return "#BDC3C7".hexToColor()
            
        }
        
    }
}
