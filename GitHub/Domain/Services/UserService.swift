//
//  UserService.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation
import RxSwift

protocol UserServiceProtocol {
    func fetchUser(login: String) -> Observable<User>
    func fetchUsers() -> Observable<[User]>
}

class UserService: UserServiceProtocol {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchUser(login: String) -> Observable<User> {
        let request = UserRequest(login: login)
        return networkManager.request(request: request)
    }
    
    func fetchUsers() -> Observable<[User]> {
        let request = UsersRequest()
        return networkManager.request(request: request)
    }
    
}
