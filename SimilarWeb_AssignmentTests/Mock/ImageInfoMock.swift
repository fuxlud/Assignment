//
//  ImageInfoMock.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation

extension ImageInfo {
    static func mock() -> ImageInfo {
        var imageInfo: ImageInfo?

        guard
            let path = Bundle.main.path(forResource: "imageInfoResponce", ofType: "json") else {
            fatalError("could not imageInfoResponce file")
        }
        
        do {
            let jsonString = try String(contentsOfFile: path)
            let data = jsonString.data(using: .utf8)!
            let imageInfoResponce = try JSONDecoder().decode(ImageInfoResponce.self, from: data)
            imageInfo = imageInfoResponce.results.first
        } catch {
            print(error.localizedDescription)
        }

        return imageInfo!
    }
}
