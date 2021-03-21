//
//  TestUserBuilder.swift
//  GitHubTests
//
//  Created by Jan Bjelicic on 07/03/2021.
//

import Foundation
@testable import GitHub

struct TestUserBuilder {
    
    static func getUser() -> Data? {
        do {
            let data = try JSONEncoder().encode(User.example)
            return data
        } catch {
            return nil
        }
    }
    
    static func getUsers() -> Data? {
        do {
            let data = try JSONEncoder().encode([User.example])
            return data
        } catch {
            return nil
        }
    }
    
}
