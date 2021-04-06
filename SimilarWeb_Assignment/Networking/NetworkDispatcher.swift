//
//  NetworkDispatcher.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 06/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

public protocol NetworkDispatcherProtocol {
    func dispatch(request: RequestProtocol, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void)
}

public struct NetworkDispatcher: NetworkDispatcherProtocol {
    public init() {}

    public func dispatch(request: RequestProtocol, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        guard let path = request.path else {
            onError(NetworkError.invalidURL)
            return
        }
        guard let url = URL(string: path) else {
            onError(NetworkError.invalidURL)
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body

        if let requestTimeout = request.requestTimeout {
            urlRequest.timeoutInterval = requestTimeout
        }

        do {
            if let params = request.parameters {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            }
        } catch {
            onError(error)
            return
        }

        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: .main)

        session.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                onError(error)
                return
            }

            guard let data = data else {
                onError(NetworkError.noData)
                return
            }

            onSuccess(data)
        }.resume()
    }
}
