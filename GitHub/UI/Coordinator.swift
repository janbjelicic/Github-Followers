//
//  Coordinator.swift
//  GitHub
//
//  Created by Jan Bjelicic on 06/03/2021.
//

import UIKit

// Keep in mind that depending on the home view controller we can have a TabViewController as well
// For more complex coordinator cases check
// https://www.youtube.com/watch?v=ueByb0MBMQ4 and https://www.youtube.com/watch?v=p9fSsoHcLTg
protocol Coordinator: class {
    var childrenCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
