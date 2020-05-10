//
//  FriendsListRepositoryImplementation.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation

enum FriendsListRepositoryError: Error {
    case invalidUser
    case urlParsingError
}

class FriendsListRepositoryImplementation: FriendsListRepository {
    
    let httpClient = HttpClient()
    
    func fetchFriendList(successHandler:@escaping ([Friend]) -> (), errorHandler:@escaping (Error) -> ()) {
        
        guard let cachedUser = fetchUserCache() else {
            errorHandler(FriendsListRepositoryError.invalidUser)
            return
        }
        
        guard let url = URL(string: API.friendsUrl.rawValue) else {
            errorHandler(FriendsListRepositoryError.urlParsingError)
            return
        }
        
        let reqeust = adptCachedUserToFriendListRequest(with: cachedUser)
        
        let networkRequest = NetworkRequest(url, httpMethod: .get, request: reqeust, response: FriendsListResponse.self, successCallback: { response in
            DispatchQueue.main.async {
                successHandler(response.friends)
            }
            
        }, errorCallBack: { error in
            DispatchQueue.main.async {
                errorHandler(error)
            }
        })
        
        self.httpClient.makeAsynchronousServiceCall(with: networkRequest)
    }

    private func adptCachedUserToFriendListRequest(with user:User) -> FriendsListRequest {
        return FriendsListRequest(uniqueID: user.guid, name: user.firstName, lastName: user.lastName)
    }
    
    private func fetchUserCache() -> User? {
        return UserCache.shared.user
    }
    
}
