//
//  MMTextField.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

class MMTextField: UITextField {
    
    private let dummyPlaceholder = "Dummy Placeholder"

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
        self.backgroundColor = StyleKit.Colours.secondaryColour()
        self.layer.borderColor = StyleKit.Colours.clear().cgColor
        self.layer.borderWidth = StyleKit.Dimensions.borderWidth()
        self.layer.cornerRadius = StyleKit.Dimensions.cornerRadius()
        self.textColor = StyleKit.Colours.white()
        self.font = StyleKit.Font.bold(withFontSize: .medium)
        self.clipsToBounds = true
        
        let attributes = [
            NSAttributedString.Key.foregroundColor : StyleKit.Colours.white().withAlphaComponent(0.3),
            NSAttributedString.Key.font: StyleKit.Font.regular(withFontSize: .medium)
        ]
        
        let attributedString = NSAttributedString(string:dummyPlaceholder, attributes:attributes)
        self.attributedPlaceholder = attributedString
    }
    
}
