//
//  UserMock.swift
//  SimilarWeb_AssignmentTests
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import Foundation
@testable import SimilarWeb_Assignment

extension User {
    static func mock() -> User {
        let imageInfoMock = ImageInfo.mock()
        guard let user  = imageInfoMock.user else {
            fatalError("Could not generate user object from imageInfoMock")
        }
        return user
    }
}
