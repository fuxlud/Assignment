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
        
        let endpoint = " https://api.unsplash.com/search/photos?page=1&client_id=c99a7e7599297260b46b7c9cf36727badeb1d37b1f24aa9ef5d844e3fbed76fe&query=sea"
    
        guard let url = URL(string: endpoint) else {
            completion(.failure(NetworkingError.couldNotConstructURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                    completion(.failure(NetworkingError.wrongDataFormat))
                    return
            }
        
//            guard let imagesData = try? JSONDecoder().decode([ImageInfo].self, from: data) else {
//                    completion(.failure(NetworkingError.wrongDataFormat))
//                    return
//            }
            
            var imageData = [ImageInfo]()
            imageData.append(ImageInfo(imageURL: URL(string: "https://pbs.twimg.com/profile_images/883859744498176000/pjEHfbdn_400x400.jpg")!, imageDescription: "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants The biological function of a flower is to facilitate"))
            
            imageData.append(ImageInfo(imageURL: URL(string: "https://pbs.twimg.com/profile_images/883859744498176000/pjEHfbdn_400x400.jpg")!, imageDescription: "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants The biological function of a flower is to facilitate"))
            
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }.resume()
            
    }
}

