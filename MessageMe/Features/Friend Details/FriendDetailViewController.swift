//
//  FriendDetailViewController.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/08.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    @IBOutlet weak var detailProfileImage: UIImageView!
    @IBOutlet weak var detailFullName: MMLabel!
    @IBOutlet weak var detailAlias: MMLabel!
    @IBOutlet weak var detailDateOfBirth: MMLabel!
    @IBOutlet weak var detailLastSeen: MMLabel!
    @IBOutlet weak var detailOnlineStatus:MMChatStatusView!
    @IBOutlet weak var dismissButton: MMButton!
    
    private var animationDuration = 1.5
    
    var friend:Friend?
    var profileImage:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        styleAlias()
        styleFullname()
        styleLastSeen()
        styleDateOfBirth()
        styleDetailImage()
        styleDismissButton()
        styleDismissButton()
        populateViewWithFriendDetails()
        hideSubviewsBeforeAnimation()
    }
    
    private func styleView() {
        self.view.backgroundColor = StyleKit.Colours.primaryColour()
    }
    
    private func styleFullname() {
        self.detailFullName.font = StyleKit.Font.bold(withFontSize: .extra_large)
        self.detailFullName.textColor = StyleKit.Colours.white()
    }
    
    private func styleAlias() {
        self.detailAlias.font = StyleKit.Font.semiBold(withFontSize: .large)
        self.detailAlias.textColor = StyleKit.Colours.white().withAlphaComponent(0.8)
    }
    
    private func styleDateOfBirth() {
        self.detailDateOfBirth.font = StyleKit.Font.semiBold(withFontSize: .medium)
        self.detailDateOfBirth.textColor = StyleKit.Colours.white().withAlphaComponent(0.6)
    }
    
    private func styleLastSeen() {
        self.detailLastSeen.font = StyleKit.Font.semiBold(withFontSize: .small)
        self.detailLastSeen.textColor = StyleKit.Colours.white().withAlphaComponent(0.4)
    }
    
    private func styleDismissButton() {
        self.dismissButton.setTitle("button.title.dismiss".localized(), for: .normal)
    }
    
    private func styleDetailImage() {
        self.detailProfileImage.layer.cornerRadius = self.detailProfileImage.frame.width / 2
        self.detailProfileImage.clipsToBounds = true
    }
    
    private func populateViewWithFriendDetails() {
        guard let friend = self.friend else  { return }
        self.detailFullName.text = "\(friend.firstName) \(friend.lastName)"
        self.detailOnlineStatus.status = friend.status.getColor()
        self.detailAlias.text = friend.alias
        self.detailProfileImage.image = profileImage
        self.detailDateOfBirth.text = friend.dateOfBirth
        self.detailLastSeen.text = friend.lastSeenFormated
    }
    
    private func hideSubviewsBeforeAnimation() {
        self.view.subviews.forEach { $0.alpha = 0}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animate(withDuration: animationDuration, delay: 0, options: .curveLinear, animations: {
            self.view.subviews.forEach { $0.alpha = 1}
        }, completion: nil)
    }

    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
