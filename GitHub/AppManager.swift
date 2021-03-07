//
//  AppManager.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation

class AppManager {
    
    static let shared = AppManager()
    let networkManager: NetworkManagerProtocol
    
    private init() {
        self.networkManager = NetworkManager()
    }
    
    // Function for initializations of managers / services.
    // Factory pattern could also have been introduced for initializing and boostraping managers and services.
    func bootstrap() {
        
    }
    
}
