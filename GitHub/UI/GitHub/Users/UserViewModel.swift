//
//  UserViewModel.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation

struct UserViewModel {
    
    private let user: User
    
    var name: String {
        user.login + " - " + (user.name ?? "")
    }
    
    init(user: User) {
        self.user = user
    }
    
}
