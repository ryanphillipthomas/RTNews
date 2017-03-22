//
//  PhotoTests.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/22/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.
//

import XCTest
import CoreData
import RTCoreData

class PhotoTests: XCTestCase {
    var context:NSManagedObjectContext!

    override func setUp() {
        super.setUp()
        context = RTCoreData.createInMemoryMainContext(modelStoreName: "RTNews", bundles: nil)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Post Get All API
    func testGetAllImages() {
        let allImagesExpectation = expectation(description: "All Photos")
        Photo.all(moc: self.context, responseCallback: {(photos, response) in
            XCTAssertTrue(photos != nil)
            allImagesExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 1000) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
