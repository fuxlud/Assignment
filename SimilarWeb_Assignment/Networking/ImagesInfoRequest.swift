//
//  ImageInfoRequest.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 06/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

extension WebService {
    public func fetchImagesDetails(with query: String, completion: @escaping (_ result: Result<[ImageInfo], Error>) -> Void) {
        if TestingService.shared.isRunningTests, TestingService.shared.isMockingNetworkingEnabled {
            let emptyArray = [ImageInfo]()
            completion(.success(emptyArray))
            return
        }

        let request = GetImageDetails(with: query)

        request.execute(dispatcher: dispatcher, onSuccess: { imagesInfoResponce in
            
            let imagesInfo = Array(imagesInfoResponce.results)
            completion(.success(imagesInfo))
            
        }) { error in
            completion(.failure(error))
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
