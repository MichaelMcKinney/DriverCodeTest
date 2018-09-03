//
//  RICUITests.swift
//  RICUITests
//
//  Created by Michael McKinney on 8/31/18.
//  Copyright © 2018 Michael McKinney. All rights reserved.
//

import XCTest

class RICUITests: XCTestCase {
	
    override func setUp() {
        super.setUp()
        		
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
	//MARK: VIEW CONTROLLER SETUP
	
	func testViewControllerAllUIExists(){
		let app = XCUIApplication()
		
		XCTAssertTrue(app.buttons["Load Test Commands"].exists)
		XCTAssertTrue(app.buttons["Run Commands"].exists)
		XCTAssertTrue(app.buttons["Reset"].exists)
	}
    
}
