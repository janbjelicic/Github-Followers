//
//  NetworkRequest.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation

enum HttpVerb: String {
    case get = "GET"
    case post = "POST"
}

protocol NetworkRequest {
    
    var path: String { get }
    var method: HttpVerb { get }
    // It depends on the backend how the headers change.
//    var headers: [String: String]? { get }
    
}

extension NetworkRequest {
    
    // For the sake of simplicity lets keep it to one base url.
    // We usually have more (dev, prod or staging)
    private var baseUrl: String {
        "https://api.github.com/"
    }
    
    private var url: URL? {
        guard var urlComponents = URLComponents(string: baseUrl) else { return nil }
        urlComponents.path += path
        return urlComponents.url
    }
 
    public func urlRequest() -> URLRequest? {
        guard let url = url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        return urlRequest
    }
    
}
