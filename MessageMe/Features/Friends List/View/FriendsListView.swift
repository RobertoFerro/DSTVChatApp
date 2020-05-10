//
//  FriendsListView.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit
import Foundation

protocol FriendsListView:class {
    func refresh()
    func navigateToFriendDetailsScreen(with friend:Friend, profileImage:UIImage)
}
