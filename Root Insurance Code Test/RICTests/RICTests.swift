//
//  RICTests.swift
//  RICTests
//
//  Created by Michael McKinney on 8/31/18.
//  Copyright © 2018 Michael McKinney. All rights reserved.
//

import XCTest
@testable import Root_Insurance_Code_Test

class RICTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	//MARK: DRIVER FUNCTIONS
	
	func testDriverInitWithNoValues(){
		let testDriver = Driver(Name: "mrTest")
		
		XCTAssert(testDriver.Name == "mrTest")
		XCTAssert(testDriver.Distance == 0)
		XCTAssert(testDriver.Speed == 0)
		
	}
	
	func testDriverInitWithValues(){
		
	}
	
	func testDriverAddFirstTrip(){
		
		
	}
	
	func testDriverAddMultipleTrips(){
		
	}
	
	func testDriverSummaryForNoMiles(){
		
	}
	
	func testDriverSummaryForSomeMiles(){
		
	}
	
	//MARK: VIEW MODEL UTILITY FUNCTIONS
	
	func testViewModelInitialization(){
		
	}
	
	func testViewModelStringParsing(){
		
	}
	
	func testViewModelSortingDrivers(){
		
	}
	
	func testViewModelTimeStringValidation(){
		//REGEX
	}
	
	func testViewModelDistanceStringValidation(){
		
	}
	
	func testViewModelTimeStringComponents(){
		
	}
	
	func testViewModelDateComponents(){
		
	}
	
	//MARK: VIEW CONTROLLER SETUP
	
	func testViewControllerAllUIExists(){
		
	}
	
	
	
}

