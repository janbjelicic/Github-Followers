//
//  AppCoordinator.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    private let networkManager = NetworkManager()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        guard let usersViewController = R.storyboard.main.usersViewControllerID() else { return }
        usersViewController.configure(viewModel:
                                        UsersViewModel(usersService: UserService(networkManager: networkManager)))
        let navigationController = UINavigationController(rootViewController: usersViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
