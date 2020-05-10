//
//  LoginView.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation

protocol LoginView:class {
    func styleView()
    func navigateToScreen(with segueIdentifier:String)
}
