//
//  ImageDetailsViewModel.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

class ImageDetailsViewModel: Modelling {
    
    private var imageInfo: ImageInfo
       
    public init(with imageInfo: ImageInfo) {
        self.imageInfo = imageInfo
    }
    
    public var likes: String {
        return "\(imageInfo.likes) 👍"
    }
    
    public var description: String {
        return imageInfo.imageDescription
    }
    
    public var imageURL: URL {
        return imageInfo.urls.regular
    }
    
    public var username: String {
        return imageInfo.user?.username ?? ""
    }
    
    public var name: String {
        return imageInfo.user?.name ?? ""
    }
    
    public var bio: String {
        return imageInfo.user?.bio ?? ""
    }
    
    public var userImageURL: URL? {
        return imageInfo.user?.profileImageURLs?.large
    }
}
