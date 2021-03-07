//
//  UserDetailsViewModel.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation
import RxSwift
import RxCocoa

class UserDetailsViewModel {
    
    let title = "Details"
    
    weak var coordinator: Coordinator?
    let user: Driver<User>
    
    init(coordinator: Coordinator, user: User) {
        self.coordinator = coordinator
        self.user = BehaviorRelay(value: user).asDriver()
    }
    
}
