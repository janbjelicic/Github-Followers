//
//  User.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation

struct User: Codable {
    
    let login: String
    let blog: String?
    let location: String?
    let twitterUsername: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case login, blog, location, name
        case twitterUsername = "twitter_username"
    }
    
}
