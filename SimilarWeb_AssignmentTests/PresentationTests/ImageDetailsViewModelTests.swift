//
//  ImageDetailsViewModelTests.swift
//  SimilarWeb_AssignmentTests
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import XCTest
@testable import SimilarWeb_Assignment

class ImageDetailsViewModelTests: XCTestCase {
    func testImageDetailsViewModel() {
        
        let imageInfo = ImageInfo.mock()
        let viewModel = ImageDetailsViewModel(with: imageInfo)
        
        XCTAssert(viewModel.bio == "Photographer. Designer. Coder. Entrepreneur. A decent man.")
        XCTAssert(viewModel.description == "orange petaled flowers")
        XCTAssert(viewModel.imageURL.absoluteString ==  "https://images.unsplash.com/photo-1490750967868-88aa4486c946?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMDQ1OTN8MHwxfHNlYXJjaHwxfHxmbG93ZXJ8ZW58MHx8fHwxNjE3NjExNjUw&ixlib=rb-1.2.1&q=80&w=1080")
        XCTAssert(viewModel.likes == "4843 👍")
        XCTAssert(viewModel.name == "Sergey Shmidt")
        XCTAssert(viewModel.userImageURL?.absoluteString == "https://images.unsplash.com/profile-fb-1455773634-7411255286d1.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128")
        XCTAssert(viewModel.username == "monstercritic")
    }
}
