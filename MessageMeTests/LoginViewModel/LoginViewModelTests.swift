//
//  LoginViewModelTests.swift
//  MessageMeTests
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import XCTest
@testable import MessageMe

class LoginViewModelTests: XCTestCase {
    
    let mockView = MockLoginView()
    let mockRepository = MockLoginRepository()
    var viewModelUnderTest:LoginViewModel?

    override func setUp() {
        viewModelUnderTest = LoginViewModel(mockView,mockRepository)
    }

    override func tearDown() {
        mockView.resetData()
        mockRepository.resetData()
        super.tearDown()
    }

    func testThatWhenTheViewDidLoadTheViewModelStylesTheView() {
        viewModelUnderTest?.viewDidLoad()
        XCTAssertTrue(mockView.styleViewInvoked)
    }
    
    func testThatWhenLoginInAnErrorIsShownIfUsernameIsEmpty() {
        let username = ""
        let password = "12345"
        viewModelUnderTest?.HandleLoginButtonPressed(with: username, password: password)
        XCTAssertTrue(mockView.presentErrorInvoked)
    }

    func testThatWhenLoginInAnErrorIsShownIfPasswordIsEmpty() {
        let username = "user"
        let password = ""
        viewModelUnderTest?.HandleLoginButtonPressed(with: username, password: password)
        XCTAssertTrue(mockView.presentErrorInvoked)
    }
    
    func testThatWhenLoginInALoaderIsShown() {
        let username = "user"
        let password = "1234"
        viewModelUnderTest?.HandleLoginButtonPressed(with: username, password: password)
        XCTAssertTrue(mockView.showLoaderInvoked)
    }
    
    func testThatOnSuccessfulLoggingInWeHideTheLoader() {
        mockRepository.shouldRunSuccessBlock = true
        let username = "user"
        let password = "1234"
        viewModelUnderTest?.HandleLoginButtonPressed(with: username, password: password)
        XCTAssertTrue(mockView.hideLoaderInvoked)
    }
    
    func testThatOnSuccessfulLoggingInWeNavigateToTheFriendDetailsScreen() {
        mockRepository.shouldRunSuccessBlock = true
        let username = "user"
        let password = "1234"
        viewModelUnderTest?.HandleLoginButtonPressed(with: username, password: password)
        XCTAssertTrue(mockView.navigateToScreenInvoked)
    }
    
    func testThatOnUnsuccessfulLoggingInWeHideTheLoader() {
        mockRepository.shouldRunErrorBlock = true
        let username = "user"
        let password = "1234"
        viewModelUnderTest?.HandleLoginButtonPressed(with: username, password: password)
        XCTAssertTrue(mockView.hideLoaderInvoked)
    }
    
    func testThatOnUnsuccessfulLoggingInAnErrorIsShownIfPasswordIsEmpty() {
        mockRepository.shouldRunErrorBlock = true
        let username = "user"
        let password = "1234"
        viewModelUnderTest?.HandleLoginButtonPressed(with: username, password: password)
        XCTAssertTrue(mockView.presentErrorInvoked)
    }

}
