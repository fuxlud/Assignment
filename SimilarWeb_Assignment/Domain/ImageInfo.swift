//
//  ImageInfo.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

struct ImageInfo: Decodable {
    let urls: ImageURLs
    let imageDescription: String
    
    enum CodingKeys: String, CodingKey {
        case imageDescription = "alt_description"
        case urls
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageDescription = try container.decode(String.self, forKey: .imageDescription)
        urls = try container.decode(ImageURLs.self, forKey: .urls)
    }
}

struct ImageURLs: Codable {
    let thumb: URL
    let full: URL
}

struct ImageInfoResponce: Decodable {
    let results: [ImageInfo]
}
