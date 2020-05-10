//
//  FriendListCell.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

class FriendListCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var onlineStatus: MMChatStatusView!
    @IBOutlet weak var alias: MMLabel!
    @IBOutlet weak var lastSeen: MMLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        style()
    }
    
    private func style() {
        self.backgroundColor = StyleKit.Colours.primaryColour()
        self.alias.textColor = StyleKit.Colours.white()
        self.alias.font = StyleKit.Font.bold(withFontSize: .medium)
        self.lastSeen.font = StyleKit.Font.bold(withFontSize: .extra_small)
        self.lastSeen.textColor = StyleKit.Colours.white().withAlphaComponent(0.5)
    }
    
    override func layoutSubviews() {
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.height / 2
        self.profileImage.clipsToBounds = true
    }

    func configure(with alias:String, onlineStatusColor:UIColor, lastSeen:String, profileImage:UIImage) {
        self.alias.text = alias
        self.onlineStatus.status = onlineStatusColor
        self.onlineStatus.setNeedsDisplay()
        self.profileImage.image = profileImage
        self.lastSeen.text = lastSeen
    }
   
}
