//
//  NetworkProxy.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case couldNotConstructURL
    case noData
    case wrongDataFormat
}

class NetworkProxy: NSObject {
    
    public func fetchImagesInfo(completion: @escaping (_ result: Result<[ImageInfo], Error>) -> Void) {
        
        let endpoint = "https://api.unsplash.com/search/photos?page=1&client_id=c99a7e7599297260b46b7c9cf36727badeb1d37b1f24aa9ef5d844e3fbed76fe&query=flower"
    
        guard let url = URL(string: endpoint) else {
            completion(.failure(NetworkingError.couldNotConstructURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                    completion(.failure(NetworkingError.wrongDataFormat))
                    return
            }
        
            guard let imagesInfoResponce = try? JSONDecoder().decode(ImageInfoResponce.self, from: data) else {
                    completion(.failure(NetworkingError.wrongDataFormat))
                    return
            }
            
            let imagesInfo = Array(imagesInfoResponce.results)
            
            DispatchQueue.main.async {
                completion(.success(imagesInfo))
            }
        }.resume()
    }
}

