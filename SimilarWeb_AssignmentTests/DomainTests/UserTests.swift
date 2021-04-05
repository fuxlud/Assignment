//
//  UserTests.swift
//  SimilarWeb_AssignmentTests
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import XCTest
@testable import SimilarWeb_Assignment

class UserTests: XCTestCase {

    func testUserProperties() {
        
        let user = User.mock()
        
        XCTAssert(user.username == "monstercritic")
        XCTAssert(user.name == "Sergey Shmidt")
        XCTAssert(user.bio == "Photographer. Designer. Coder. Entrepreneur. A decent man.")
    }
}
