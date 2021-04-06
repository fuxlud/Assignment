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
    
    var session = URLSession.shared
    
    public func fetchImagesInfo(query: String, completion: @escaping (_ result: Result<[ImageInfo], Error>) -> Void) {
        
        session.invalidateAndCancel()
        
        let endpoint = "\(Constants.endpoint)"
        let path = String.localizedStringWithFormat(endpoint, query)

        guard let url = URL(string: path) else {
            completion(.failure(NetworkingError.couldNotConstructURL))
            return
        }

        session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkingError.wrongDataFormat))
                }
                return
            }
        
            guard let imagesInfoResponce = try? JSONDecoder().decode(ImageInfoResponce.self, from: data) else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkingError.wrongDataFormat))
                }
                return
            }
            
            let imagesInfo = Array(imagesInfoResponce.results)
            
            DispatchQueue.main.async {
                completion(.success(imagesInfo))
            }
        }.resume()
    }
}

