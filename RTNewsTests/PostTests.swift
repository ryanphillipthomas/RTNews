//
//  PostTests.swift
//  RTNewsTests
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.
//

import XCTest
import CoreData
import RTCoreData

@testable import RTNews

class PostTests: XCTestCase {
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
    func testGetAllPosts() {
        let allPostsExpectation = expectation(description: "All Posts")
        Post.all(moc: self.context, responseCallback: {(posts, response) in
            XCTAssertTrue(posts != nil)
            allPostsExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 1000) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
