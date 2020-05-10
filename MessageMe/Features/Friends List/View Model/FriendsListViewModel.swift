//
//  FriendsListViewModel.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit
import Foundation

class FriendsListViewModel {

    private var friends:[Friend]?
    private var viewHasAlreadyLoaded = false
    private let imageRepository:ImageRepository
    private var friendImages:[Int:UIImage] = [:]
    private let friendsRepository: FriendsListRepository
    private let placeHolderImage = UIImage(named:"profile_placeholder")
    private weak var view:(FriendsListView & Loadable & ErrorPresentable)?
    
    init(view:(FriendsListView & Loadable & ErrorPresentable), friendsRepository:FriendsListRepository, imageRepository:ImageRepository) {
        self.view = view
        self.imageRepository = imageRepository
        self.friendsRepository = friendsRepository
    }
    
    func viewWillAppear() {
        if (!viewHasAlreadyLoaded){
            viewHasAlreadyLoaded = true
            self.view?.showLoader()
            self.friendsRepository.fetchFriendList(successHandler:handleListOfFriendsSuccessfullyFetched, errorHandler:handleListOfFriendsError)
        }
        
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return self.friends?.count ?? 0
    }
    
    private func handleListOfFriendsSuccessfullyFetched(friends:[Friend]) {
        self.view?.hideLoader()
        self.friends = friends
        self.view?.refresh()
    }
    
    func fetchCellInformation(at index:Int) -> (String,UIColor,String,UIImage)? {
        
        guard let friends = self.friends else { return nil }
        let friendsAtIndex = friends[index]

        let alias = friendsAtIndex.alias
        let url = friendsAtIndex.imageURL
        let onlineStatusColor = friendsAtIndex.status.getColor()
        let lastSeen = friendsAtIndex.lastSeenFormated
        
        
        if let friendImage = self.imageRepository.fetchImage(with: url, completionHandler: handleUrlImageReturned) {
            return (alias,onlineStatusColor,lastSeen,friendImage)
        } else {
            let placeHolderImage = self.placeHolderImage ?? UIImage()
            return (alias,onlineStatusColor,lastSeen, placeHolderImage)
        }
        
    }
    
    func handleFriendSelected(at index:Int) {
        
        guard let friends = self.friends else { return }
        let friendsAtIndex = friends[index]
        let url = friendsAtIndex.imageURL
        
        if let friendImage = self.imageRepository.fetchImage(with: url, completionHandler: handleUrlImageReturned) {
            self.view?.navigateToFriendDetailsScreen(with: friendsAtIndex, profileImage: friendImage)
        } else {
            let placeHolderImage = self.placeHolderImage ?? UIImage()
            self.view?.navigateToFriendDetailsScreen(with: friendsAtIndex, profileImage:placeHolderImage)
        }
        
    }
    
    private func handleUrlImageReturned() {
        self.view?.refresh()
    }
    
    private func handleListOfFriendsError(error:Error) {
        self.view?.hideLoader()
        self.view?.presentError(with: "friendList.serviceCallErrorMessage".localized())
        
    }
}
