//
//  reciptAppTests.swift
//  reciptAppTests
//
//  Created by Asmaa_Abdelfattah on 14/05/1402 AP.
//

import XCTest
@testable import reciptApp
import CoreData
final class reciptAppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testRecipesAPI() throws {
        let expectation = expectation(description: "Waiting for API")
        
        NetworkService.fetch (url: recipeUrl, compiletionHandler: { data in
            guard let response : [Recipe] = data else
            {
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(response.count, 0 , "Recipe API Failed")
        
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5,handler: nil)
    }
    func testRecipesFavouriteCoredata() throws {
        let expectation = expectation(description: "Waiting for Core data")
        
        guard let response : [NSManagedObject]? = CoreDataManager.getInstance().fetchFromCoreData() else
            {
                XCTFail()
                expectation.fulfill()
                return
            }
        
        XCTAssertNotNil(response)
            expectation.fulfill()
        waitForExpectations(timeout: 5,handler: nil)
    }

 
}
