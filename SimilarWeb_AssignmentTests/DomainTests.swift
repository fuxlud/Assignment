//
//  SimilarWeb_AssignmentTests.swift
//  SimilarWeb_AssignmentTests
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import XCTest
@testable import SimilarWeb_Assignment

class DomainTests: XCTestCase {

    var imageInfo: ImageInfo!
    
    override func setUp() {
        imageInfo = ImageInfo.mock()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testImageInfoProperties() {
        XCTAssert(imageInfo.imageDescription == "orange petaled flowers")
        XCTAssert(imageInfo.likes == 4843)
    }
    
    func testUserProperties() {
        let user = imageInfo.user
        
        XCTAssert(user!.username == "monstercritic")
        XCTAssert(user!.name == "Sergey Shmidt")
        XCTAssert(user!.bio == "Photographer. Designer. Coder. Entrepreneur. A decent man.")
    }

    func testImageInfoURLS() {
        let urls = imageInfo.urls

        XCTAssert(urls.thumb.absoluteString == "https://images.unsplash.com/photo-1490750967868-88aa4486c946?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMDQ1OTN8MHwxfHNlYXJjaHwxfHxmbG93ZXJ8ZW58MHx8fHwxNjE3NjExNjUw&ixlib=rb-1.2.1&q=80&w=200")
        XCTAssert(urls.full.absoluteString == "https://images.unsplash.com/photo-1490750967868-88aa4486c946?crop=entropy&cs=srgb&fm=jpg&ixid=MnwxMDQ1OTN8MHwxfHNlYXJjaHwxfHxmbG93ZXJ8ZW58MHx8fHwxNjE3NjExNjUw&ixlib=rb-1.2.1&q=85")
        XCTAssert(urls.regular.absoluteString == "https://images.unsplash.com/photo-1490750967868-88aa4486c946?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMDQ1OTN8MHwxfHNlYXJjaHwxfHxmbG93ZXJ8ZW58MHx8fHwxNjE3NjExNjUw&ixlib=rb-1.2.1&q=80&w=1080")
    }

//    class func decodeableFromImageInfoResponse() -> ImageInfoResponce {
//        let path = Bundle(for: self).path(forResource: "imageInfoResponce", ofType: "json")!
//        let jsonString = try! String(contentsOfFile: path)
//        let data = jsonString.data(using: .utf8)!
//        let decodedObject = try! JSONDecoder().decode(ImageInfoResponce.self, from: data)
//        return decodedObject
//    }

}
