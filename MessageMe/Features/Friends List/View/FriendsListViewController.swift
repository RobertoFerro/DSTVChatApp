//
//  FriendsListViewController.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

class FriendsListViewController: UITableViewController, FriendsListView {
    
    private let cellIdentifier = "FriendListCell"
    private let cellNibName = "FriendListCell"
    private let friendDetailSegueIdentifier = "FriendDetailViewController"
    
    lazy var viewModel: FriendsListViewModel = {
        let lazyLoadedViewModel = FriendsListViewModel(view: self, friendsRepository: FriendsListRepositoryImplementation(), imageRepository: ImageRepositoryImplementation())
        return lazyLoadedViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerViews()
        self.title = "friendList.title".localized()
        self.tableView.separatorColor = StyleKit.Colours.clear()
        self.tableView.backgroundColor = StyleKit.Colours.primaryColour()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.viewWillAppear()
    }
    
    private func registerViews() {
        let bundle = Bundle(for: FriendsListViewController.self)
        self.tableView.register(UINib.init(nibName:cellNibName, bundle: bundle), forCellReuseIdentifier:cellIdentifier)
    }
        
    func refresh() {
        self.tableView.reloadData()
    }
        
    func navigateToFriendDetailsScreen(with friend:Friend, profileImage:UIImage) {
        
        guard let storyboard = self.storyboard else { return }
        
        guard let friendDetailsViewController = storyboard.instantiateViewController(withIdentifier: friendDetailSegueIdentifier) as? FriendDetailViewController else {
            return
        }
        
        friendDetailsViewController.friend = friend
        friendDetailsViewController.profileImage = profileImage
        friendDetailsViewController.modalPresentationStyle = .popover
        friendDetailsViewController.modalTransitionStyle = .coverVertical
        self.present(friendDetailsViewController, animated: true, completion: nil)
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FriendListCell else {
            return UITableViewCell()
        }
        
        guard let cellData = self.viewModel.fetchCellInformation(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.configure(with: cellData.0, onlineStatusColor: cellData.1, lastSeen:cellData.2,  profileImage: cellData.3)
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.handleFriendSelected(at: indexPath.row)
    }

}


