//
//  ImageInfoViewModelTests.swift
//  SimilarWeb_AssignmentTests
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import XCTest
@testable import SimilarWeb_Assignment

class ImageInfoViewModelTests: XCTestCase {

    func testImageInfoViewModel() {
        
        let imageInfo = ImageInfo.mock()
        let viewModel = ImageInfoViewModel(with: imageInfo)
        
        XCTAssert(viewModel.imageURL.absoluteString == "https://images.unsplash.com/photo-1490750967868-88aa4486c946?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMDQ1OTN8MHwxfHNlYXJjaHwxfHxmbG93ZXJ8ZW58MHx8fHwxNjE3NjExNjUw&ixlib=rb-1.2.1&q=80&w=200")
        XCTAssert(viewModel.description == "orange petaled flowers")
    }
}
