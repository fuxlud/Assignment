//
//  User.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

struct User: Decodable {
    let username: String?
    let name: String?
    let bio: String?
    let profileImageURLs: ProfileImageURLs?
    
    enum CodingKeys: String, CodingKey {
        case profileImageURLs = "profile_image"
        case username
        case name
        case bio
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        username = try? container.decode(String.self, forKey: .username)
        name = try? container.decode(String.self, forKey: .name)
        bio = try? container.decode(String.self, forKey: .bio)
        profileImageURLs = try? container.decode(ProfileImageURLs.self, forKey: .profileImageURLs)
    }
}

struct ProfileImageURLs: Codable {
    let small: URL
    let medium: URL
    let large: URL
}
