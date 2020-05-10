//
//  LoginRepository.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation

protocol LoginRepository:class {
    func loginUser(with username:String,and password:String, successBlock:@escaping (LoginResponse)->(),errorBlock:@escaping (Error)->())
}
