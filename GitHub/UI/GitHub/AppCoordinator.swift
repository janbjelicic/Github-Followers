//
//  AppCoordinator.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func showDetails(user: User)
}

#warning("Implement UI test by using this class and checking if users view controller is the first controller shown")
class AppCoordinator: AppCoordinatorProtocol {
    
    private let window: UIWindow
    var childrenCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        guard let usersViewController = R.storyboard.main.usersViewControllerID() else { return }
        let userService = UserService(networkManager: AppManager.shared.networkManager)
        let usersViewModel = UsersViewModel(coordinator: self,
                                            usersService: userService)
        usersViewController.configure(viewModel: usersViewModel)
        navigationController.pushViewController(usersViewController, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showDetails(user: User) {
        guard let userDetailsViewController = R.storyboard.main.userDetailsViewControllerID() else { return }
        let userDetailsViewModel = UserDetailsViewModel(coordinator: self,
                                                        user: user)
        userDetailsViewController.configure(viewModel: userDetailsViewModel)
        navigationController.pushViewController(userDetailsViewController, animated: true)
    }
    
}
