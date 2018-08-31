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
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
