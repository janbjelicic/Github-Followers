//
//  UserServiceTests.swift
//  GitHubTests
//
//  Created by Jan Bjelicic on 06/03/2021.
//

import XCTest
@testable import GitHub

class UserServiceTests: XCTestCase {
    
    private var sut: UserService!
    private var fakeNetworkManager: FakeNetworkManager!
    
    override func setUp() {
        super.setUp()
        self.fakeNetworkManager = FakeNetworkManager()
        self.sut = UserService(networkManager: fakeNetworkManager)
    }
    
    func test_given_fetchUsers_then_checkPathMethod() {
        let expectation = XCTestExpectation(description: #function)
        sut.fetchUsers().subscribe(onNext: { _ in
            expectation.fulfill()
        }, onError: { error in
            XCTFail("Test should not fail \(error)")
        }).dispose()
        
    }
    
}
