//
//  LoginViewModel.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    private let repository: LoginRepository
    private weak var view:(LoginView & Loadable & ErrorPresentable)?
    private let friendScreenSegueIdentidier = "FriendsListScreen"
    
    init(_ view:LoginView & Loadable & ErrorPresentable,_ repository:LoginRepository) {
        self.view = view
        self.repository = repository
    }
    
    func viewDidLoad() {
        self.view?.styleView()
    }
    
    func HandleLoginButtonPressed(with username:String, password:String) {
        
        if username == "" {
            self.view?.presentError(with: "login.usernameErrorMessage".localized())
            return
        }
        
        if password == "" {
            self.view?.presentError(with: "login.passwordErrorMessage".localized())
            return
        }
        
        self.view?.showLoader()
        self.repository.loginUser(with: username, and: password, successBlock: handleUserSuccessfullyLoggedIn, errorBlock: handleLoginError)
    }
    
    func handleUserSuccessfullyLoggedIn(response:LoginResponse) {
        self.view?.hideLoader()
        self.view?.navigateToScreen(with:friendScreenSegueIdentidier)
    }
    
    func handleLoginError( error:Error) {
        self.view?.hideLoader()
        self.view?.presentError(with: "login.serviceCallErrorMessage".localized())
    }
}
