//
//  NetworkManager.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import Foundation
import RxSwift

protocol NetworkManagerProtocol {
    func request<T: Codable>(request: NetworkRequest) -> Observable<T>
}

class NetworkManager: NetworkManagerProtocol {
    
    var urlSession: URLSession!
    private let disposeBag = DisposeBag()
    
    init() {
        let urlSessionConfiguration = URLSessionConfiguration.default
        urlSessionConfiguration.timeoutIntervalForResource = 30
        
        // Possible to customize a delegation queue where you can
        // for example define how many operations do you want to support
        // in a queue.
        urlSession = URLSession(configuration: urlSessionConfiguration)
    }
    
    deinit {
        urlSession.invalidateAndCancel()
        urlSession = nil
    }
    
    // Simple implementation that can be used from multiple services and can provide different generic responses.
    // Also we are expecting to receive json.
    func request<T: Codable>(request: NetworkRequest) -> Observable<T> {
        guard let urlRequest = request.urlRequest() else {
            return Observable.error(NetworkError.badRequest)
        }
        return Observable<T>.create { [weak self] observer in
            guard let self = self else {
                return Disposables.create()
            }
            let task = self.urlSession.dataTask(with: urlRequest) { (data, error, response) in
                do {
                    let response = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(response)
                } catch {
                    observer.onError(error)
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
