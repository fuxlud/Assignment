//
//  MockDispatcher.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 06/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

public struct MockDispatcher: NetworkDispatcherProtocol, Equatable {
    let jsonStub: String?

    public func dispatch(request: RequestProtocol, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        if let jsonData = jsonStub?.data(using: .utf8, allowLossyConversion: false) {
            onSuccess(jsonData)
        } else {
            onError(NSError(domain: "network failure", code: 101, userInfo: nil))
        }
    }
}
