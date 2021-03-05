//
//  UsersRequest.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation

struct UsersRequest: NetworkRequest {
    
    var path: String {
        return "users"
    }
    
    var method: HttpVerb {
        return .get
    }
    
    var headers: [String: String]? {
        nil
    }
    
}
