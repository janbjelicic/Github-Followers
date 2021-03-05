//
//  UsersViewModel.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation
import RxSwift

class UsersViewModel {
    
    let title = "Users"
    
    private let usersService: UserServiceProtocol
    
    init(usersService: UserServiceProtocol) {
        self.usersService = usersService
    }
    
    func getUsers() -> Observable<[UserViewModel]> {
        return usersService.fetchUsers().map { users in
            users.map { user in
                UserViewModel(user: user)
            }
        }
    }
    
}
