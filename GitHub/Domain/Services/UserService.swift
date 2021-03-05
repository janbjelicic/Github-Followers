//
//  UserService.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation
import RxSwift

protocol UserServiceProtocol {
    func fetchUser() -> Observable<User>
    func fetchUsers() -> Observable<[User]>
}

class UserService: UserServiceProtocol {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchUser() -> Observable<User> {
        let request = UserRequest()
        return networkManager.request(request: request)
    }
    
    func fetchUsers() -> Observable<[User]> {
        let request = UsersRequest()
        return networkManager.request(request: request)
    }
    
}
