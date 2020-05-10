//
//  MockLoginRepository.swift
//  MessageMeTests
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation
@testable import MessageMe

enum MockRepositoryError: Error {
    case genericError
    
    var localizedDescription: String {
        switch self {
        case .genericError: return "There was an error"
        }
    }
}


class MockLoginRepository:LoginRepository {
    
    var loginUserInvoked = false
    var shouldRunErrorBlock = false
    var shouldRunSuccessBlock = false
    
    func loginUser(with username: String, and password: String, successBlock: @escaping (LoginResponse) -> (), errorBlock: @escaping (Error) -> ()) {
        loginUserInvoked = true
        
        if shouldRunSuccessBlock {
            let response = LoginResponse(result: true, guid: "1-2-3-4-5", firstName: "Roberto", lastName: "Ferro")
            successBlock(response)
        } else if shouldRunErrorBlock {
            errorBlock(MockRepositoryError.genericError)
        }
        
    }
    
    func resetData() {
        loginUserInvoked = false
        shouldRunErrorBlock = false
        shouldRunSuccessBlock = false
    }
}
