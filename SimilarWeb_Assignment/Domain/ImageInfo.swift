//
//  ImageInfo.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

public struct ImageInfo: Decodable {
    let urls: ImageURLs
    let imageDescription: String
    let likes: Int
    let user: User?
    
    enum CodingKeys: String, CodingKey {
        case imageDescription = "alt_description"
        case urls
        case likes
        case user
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageDescription = try container.decode(String.self, forKey: .imageDescription)
        urls = try container.decode(ImageURLs.self, forKey: .urls)
        likes = try container.decode(Int.self, forKey: .likes)
        user = try? container.decode(User.self, forKey: .user)
    }
}

struct ImageURLs: Codable {
    let thumb: URL
    let full: URL
    let regular: URL
}
