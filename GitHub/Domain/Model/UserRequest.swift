//
//  UserRequest.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation

struct UserRequest: NetworkRequest {
    
    var path: String {
        return "users/janbjelicic"
    }
    
    var method: HttpVerb {
        return .get
    }
    
    var headers: [String: String]? {
        nil
    }
    
}
