//
//  FriendsListRepository.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation

protocol FriendsListRepository {
    func fetchFriendList(successHandler:@escaping ([Friend]) -> (), errorHandler:@escaping (Error) -> ())
}
