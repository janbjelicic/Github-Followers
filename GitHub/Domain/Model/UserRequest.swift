//
//  UserRequest.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation

struct UserRequest {
    
    let login: String
    
}

extension UserRequest: NetworkRequest {
    
    var path: String {
        return "users/" + login
    }
    
    var method: HttpVerb {
        return .get
    }
    
    var headers: [String: String]? {
        nil
    }
    
}
