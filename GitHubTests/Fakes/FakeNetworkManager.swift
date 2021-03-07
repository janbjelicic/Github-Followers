//
//  FakeNetworkManager.swift
//  GitHubTests
//
//  Created by Jan Bjelicic on 06/03/2021.
//

import Foundation
import RxSwift
@testable import GitHub

class FakeNetworkManager: NetworkManagerProtocol {
    
    var path: String?
    var method: HttpVerb?
    
    init() {}
    
    func request<T: Codable>(request: NetworkRequest) -> Observable<T> {
        path = request.path
        method = request.method
        
        let users = [User]()
        return Observable.just(users)
    }
    
}
