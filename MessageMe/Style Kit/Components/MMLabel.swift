//
//  MMLabel.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

class MMLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    func commonInit() {
        self.textColor = StyleKit.Colours.titleColor()
        self.font = StyleKit.Font.regular(withFontSize: .medium)
    }
}
