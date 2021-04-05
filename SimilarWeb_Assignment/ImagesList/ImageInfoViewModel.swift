//
//  ImageInfoViewModel.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

class ImageInfoViewModel: Modelling {
    
    private var imageInfo: ImageInfo!
    
    public init(with imageInfo: ImageInfo) {
        self.imageInfo = imageInfo
    }
    
    public var description: String {
        return imageInfo.imageDescription
    }
    
    public var imageURL: URL {
        return imageInfo.imageURL
    }
}
