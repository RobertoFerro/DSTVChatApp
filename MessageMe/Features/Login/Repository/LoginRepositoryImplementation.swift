//
//  LoginRepositoryImplementation.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation

class LoginRepositoryImplementation: LoginRepository {
 
    let httpClient = HttpClient()
    
    func loginUser(with username:String,and password:String, successBlock:@escaping (LoginResponse)->(),errorBlock:@escaping (Error)->()) {
        
        let loginRequest = LoginRequest(username:username, password:password)
        
        guard let url = URL(string: API.loginUrl.rawValue) else { return }
        
        let networkRequest = NetworkRequest(url, httpMethod: .post, request: loginRequest, response: LoginResponse.self,
           successCallback: { response in
                DispatchQueue.main.async {
                    UserCache.shared.user = User(guid: response.guid, firstName: response.firstName, lastName: response.lastName)
                    successBlock(response)
                }
            }, errorCallBack:{ error in
                DispatchQueue.main.async {
                    errorBlock(error)
                }
            } )
        
        self.httpClient.makeAsynchronousServiceCall(with: networkRequest)

    }
    
}
