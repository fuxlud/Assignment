//
//  RequestType.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 06/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

public protocol RequestTypeProtocol {
    associatedtype ResponseType: Decodable

    var data: Request? { get }
}

public extension RequestTypeProtocol {
    func execute(dispatcher: NetworkDispatcherProtocol, onSuccess: @escaping (ResponseType) -> Void, onError: @escaping (Error) -> Void) {
        guard let data = data else { return }

        dispatcher.dispatch(
            request: data,
            onSuccess: { (responseData: Data) in
                do {
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(ResponseType.self, from: responseData)
                    DispatchQueue.main.async {

                        onSuccess(result)
                    }
                } catch {
                    DispatchQueue.main.async {
                        
                        onError(error)
                    }
                }
            },
            onError: { (error: Error) in
                DispatchQueue.main.async {

                    onError(error)
                }
            }
        )
    }
}
