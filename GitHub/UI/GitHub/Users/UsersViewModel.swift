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
    
    private var usersData: [User] = []
    
    private let usersService: UserServiceProtocol
    // This coordinator will be unaccessible from the outside of the VC that holds the VM.
    // This way we control the general routing from the outside and the immediate routing from the inside.
    weak var coordinator: AppCoordinatorProtocol?
    
    init(coordinator: AppCoordinatorProtocol, usersService: UserServiceProtocol) {
        self.coordinator = coordinator
        self.usersService = usersService
    }
    
    func getUsers() -> Observable<[UserViewModel]> {
        return usersService.fetchUsers().map { [weak self] users in
            guard let self = self else { return [] }
            self.usersData = users
            return users.map { user in
                UserViewModel(user: user)
            }
        }
    }
    
    func getUser(index: Int) -> Observable<User> {
        let user = usersData[index]
        return usersService.fetchUser(login: user.login)
    }
    
    func showDetails(user: User) {
        coordinator?.showDetails(user: user)
    }
    
}
