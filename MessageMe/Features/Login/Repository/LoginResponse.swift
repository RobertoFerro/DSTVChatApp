//
//  LoginResponse.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let result: Bool
    let guid, firstName, lastName: String
}
