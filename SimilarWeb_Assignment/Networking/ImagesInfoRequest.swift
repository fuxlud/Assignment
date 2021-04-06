//
//  ImageInfoRequest.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 06/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

extension WebService {
    public func fetchImagesDetails(with query: String, completion: @escaping NetworkResponseCompletion) {
        if TestingService.shared.isRunningTests, TestingService.shared.isMockingNetworkingEnabled {
            completion(true, nil)
            return
        }

        let request = GetImageDetails(with: query)

        request.execute(dispatcher: dispatcher, onSuccess: { imagesInfoResponce in
            
            let imagesInfo = Array(imagesInfoResponce.results)
            completion(imagesInfo, nil)
            
        }) { error in
            completion(nil, error)
        }
    }
}

struct GetImageDetails: RequestTypeProtocol {
    typealias ResponseType = ImageInfoResponce

    private var query: String

    init(with query: String) {
        self.query = query
    }

    var data: Request? {
        let endpoint: String = EndPoints.images.rawValue
        let path = String.localizedStringWithFormat(endpoint, query)

        return Request(path: path)
    }
}
