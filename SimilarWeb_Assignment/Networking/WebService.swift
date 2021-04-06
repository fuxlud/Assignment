//
//  WebService.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 06/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

public protocol WebServiceProtocol {
    var dispatcher: NetworkDispatcherProtocol! { get set }
}

public struct WebService {
    var dispatcher: NetworkDispatcherProtocol!

    public init(dispatcher: NetworkDispatcherProtocol = NetworkDispatcher()) {
        self.dispatcher = dispatcher
    }
}
