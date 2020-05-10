//
//  OnlineStatus.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/06.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

class MMChatStatusView: UIView {

    var status:UIColor?
    
    init(status:UIColor) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        guard let status = self.status else { return }
        StyleKit.Colours.primaryColour().setStroke()
        status.setFill()
        path.fill()
        path.lineWidth = 10
        path.stroke()
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.bounds.height / 2
        self.clipsToBounds = true
    }
    
}
