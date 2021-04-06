//
//  NetworkingTests.swift
//  SimilarWeb_AssignmentTests
//
//  Created by Admin on 06/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import XCTest
@testable import SimilarWeb_Assignment

class NetworkingTests: XCTestCase {
    
    var stubResponse = NetworkingTests.stubResponse()

    class func stubResponse() -> String {
        let path = Bundle(for: self).path(forResource: "imageInfoResponce", ofType: "json")!
        let jsonString = try! String(contentsOfFile: path)
        return jsonString
    }
    
    func testRequestSuccess() {
        let request = MockImagesInfoRequest()
        let mockDispatcher = MockDispatcher(jsonStub: stubResponse)

        request.execute(dispatcher: mockDispatcher, onSuccess: { (imageInfoResponce) in
            let imageInfo = imageInfoResponce.results.first
            XCTAssertEqual(imageInfo?.imageDescription, "orange petaled flowers")
            XCTAssertEqual(imageInfo?.likes, 4843)
        }) { (error) in
            XCTFail(error.localizedDescription)
        }
    }

    func testRequestFailure() {
        let request = MockImagesInfoRequest()
        let mockDispatcher = MockDispatcher(jsonStub: nil)
        request.execute(dispatcher: mockDispatcher, onSuccess: { _ in
            XCTFail("imagesInfo should be nil")
        }) { (error: Error) in
            let error = error as NSError

            XCTAssert(error.code == 101)
            XCTAssert(error.domain == "network failure")
        }
    }

    func testWebServiceHasDispatcherSet() {
        let mockDispatcher = MockDispatcher(jsonStub: nil)
        let webService = WebService(dispatcher: mockDispatcher)

        XCTAssertTrue(webService.dispatcher as? MockDispatcher != nil)
    }

    func testWebServiceSetsDefaultDispatcher() {
        let webService = WebService()
        let dispatcher = webService.dispatcher
        XCTAssertNotNil(dispatcher)
    }

    func testWebServiceRequestSuccess() {
        let mockDispatcher = MockDispatcher(jsonStub: stubResponse)
        let mockWebService = MockWebService(dispatcher: mockDispatcher)
        
        mockWebService.getImageInfo { (imagesInfo, error) in
            if let imagesInfo = imagesInfo {
                let imageInfo = imagesInfo.first
                XCTAssertEqual(imageInfo?.imageDescription, "orange petaled flowers")
                XCTAssertEqual(imageInfo?.likes, 4843)
            } else {
                if let error = error {
                    XCTFail(error.localizedDescription)
                }
            }
        }
    }

    func testWebServiceRequestFailure() {
        let mockDispatcher = MockDispatcher(jsonStub: nil)
        let mockWebService = MockWebService(dispatcher: mockDispatcher)
        
        mockWebService.getImageInfo { (imagesInfo, error) in
            if imagesInfo != nil {
                XCTFail("imagesInfo should be nil")
            } else {
                guard let error = error as NSError? else {
                    XCTFail("error is nil")
                    return
                }

                XCTAssert(error.code == 101)
                XCTAssert(error.domain == "network failure")
            }
        }
    }

    func testDispatcherReturnsParsesJSONAndReturnsModel() {
        let mockDispatcher = MockDispatcher(jsonStub: stubResponse)
        mockDispatcher.dispatch(request: Request(path: nil), onSuccess: { data in
            let imagesInfo = try? JSONDecoder().decode(MockImagesInfoRequest.ResponseType.self, from: data)
            XCTAssertNotNil(imagesInfo)
            let imageInfo = imagesInfo?.results.first
            XCTAssertEqual(imageInfo?.imageDescription, "orange petaled flowers")
            XCTAssertEqual(imageInfo?.likes, 4843)
        }) { error in
            XCTFail(error.localizedDescription)
        }
    }
}

struct StubImageInfo: Codable {
    let id: String
    let name: String
    let image: String
}

struct MockImagesInfoRequest: RequestTypeProtocol {
    typealias ResponseType = ImageInfoResponce

    var data: Request? {
        Request(path: nil)
    }
}

struct MockWebService: WebServiceProtocol {
    var dispatcher: NetworkDispatcherProtocol!
}

extension MockWebService {
    func getImageInfo(completion: @escaping ([ImageInfo]?, Error?) -> Void) {
        let requestImagesInfo = MockImagesInfoRequest()

        requestImagesInfo.execute(dispatcher: dispatcher, onSuccess: { (imageInfoResponce) in
            let imagesInfo = imageInfoResponce.results
            completion(imagesInfo, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
}


