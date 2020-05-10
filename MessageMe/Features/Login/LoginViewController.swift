//
//  ViewController.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginView {
    
    @IBOutlet weak var loginTitle: MMTitleLabel!
    @IBOutlet weak var username: MMTextField!
    @IBOutlet weak var password: MMTextField!
    @IBOutlet weak var loginButton: MMButton!
    
    lazy var viewModel: LoginViewModel = {
           let lazyLoadedViewModel = LoginViewModel(self, LoginRepositoryImplementation())
           return lazyLoadedViewModel
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.viewDidLoad()
    }
    
    func styleView() {
        let loginTitle = "login.title".localized()
        self.loginTitle.text = loginTitle
        self.username.placeholder = "login.usernamePlaceHolder".localized()
        self.password.placeholder = "login.passwordPlaceHolder".localized()
        self.password.isSecureTextEntry = true
        self.loginButton.setTitle(loginTitle, for: .normal)
        self.view.backgroundColor = StyleKit.Colours.primaryColour()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let username = self.username.text ?? ""
        let password = self.password.text ?? ""
        self.viewModel.HandleLoginButtonPressed(with: username, password: password)
    }
        
    func navigateToScreen(with segueIdentifier:String) {
        self.performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
    
}

