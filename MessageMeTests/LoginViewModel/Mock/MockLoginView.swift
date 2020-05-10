//
//  MockLoginView.swift
//  MessageMeTests
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation
@testable import MessageMe

class MockLoginView:LoginView, Loadable, ErrorPresentable {
    
    var loading = Loading(frame: .zero)
    
    var styleViewInvoked = false
    var navigateToScreenInvoked = false
    var showLoaderInvoked = false
    var hideLoaderInvoked = faOlse
    var presentErrorInvoked = false
    
    func styleView() {
        styleViewInvoked = true
    }
    
    func navigateToScreen(with segueIdentifier: String) {
        navigateToScreenInvoked = true
    }

    func showLoader() {
        showLoaderInvoked = true
    }
    
    func hideLoader() {
        hideLoaderInvoked = true
    }
    
    func presentError(with message: String) {
        presentErrorInvoked = true
    }
    
    func resetData() {
        styleViewInvoked = false
        navigateToScreenInvoked = false
        showLoaderInvoked = false
        hideLoaderInvoked = false
        presentErrorInvoked = false
    }
    
    
}
