//
//  MMButton.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

class MMButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    func commonInit() {
        self.heightAnchor.constraint(equalToConstant:StyleKit.Dimensions.Component.Height.semiLarge()).isActive = true
        self.backgroundColor = StyleKit.Colours.tertiaryColor()
        self.layer.borderColor = StyleKit.Colours.clear().cgColor
        self.layer.borderWidth = StyleKit.Dimensions.borderWidth()
        self.layer.cornerRadius = StyleKit.Dimensions.cornerRadius()
        self.titleLabel?.font = StyleKit.Font.bold(withFontSize: .large)
        self.setTitleColor(StyleKit.Colours.white(), for: .normal)
    }

}
