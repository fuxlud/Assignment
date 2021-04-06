//
//  Request.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 06/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

public protocol RequestProtocol {
    var path: String? { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var parameters: [String: Any?]? { get }
    var headers: [String: String]? { get }
    var requestTimeout: TimeInterval? { get }
}

public struct Request: RequestProtocol {
    public let path: String?
    public let method: HTTPMethod
    public let body: Data?
    public let parameters: [String: Any?]?
    public let headers: [String: String]?
    public let requestTimeout: TimeInterval?

    public init(path: String?,
                method: HTTPMethod = .get,
                body: Data? = nil,
                parameters: [String: Any?]? = nil,
                headers: [String: String]? = nil,
                requestTimeout: TimeInterval? = nil) {
        self.path = path
        self.method = method
        self.body = body
        self.parameters = parameters
        self.headers = headers
        self.requestTimeout = requestTimeout
    }
}
