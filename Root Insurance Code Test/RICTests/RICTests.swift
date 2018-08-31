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
	
	func testDriverAddFirstTrip(){
		let testDriver = Driver(Name: "mrTest")
		
		var testStartDateComponents = DateComponents()
		testStartDateComponents.hour = 2
		testStartDateComponents.minute = 30
		
		var testEndDateComponents = DateComponents()
		testEndDateComponents.hour = 4
		testEndDateComponents.minute = 30
		
		let testDistance:Float = 10.0
		
		testDriver.AddTrip(StartTimeComponents: testStartDateComponents, EndTimeComponents: testEndDateComponents, Distance: testDistance)
		
		//2 hours with 10 miles traveled
		
		XCTAssert(testDriver.Distance == 10)
		XCTAssert(testDriver.Speed == 5)
		
	}
	
	func testDriverAddMultipleTrips(){
		//First Trip
		let testDriver = Driver(Name: "mrTest")
		
		var testStartDateComponents = DateComponents()
		testStartDateComponents.hour = 2
		testStartDateComponents.minute = 30
		
		var testEndDateComponents = DateComponents()
		testEndDateComponents.hour = 4
		testEndDateComponents.minute = 30
		
		var testDistance:Float = 10.0
		
		testDriver.AddTrip(StartTimeComponents: testStartDateComponents, EndTimeComponents: testEndDateComponents, Distance: testDistance)
		
		//2 hours with 10 miles traveled (5 mph)
		
		//Second Trip
		testStartDateComponents.hour = 13
		testStartDateComponents.minute = 45
		
		testEndDateComponents.hour = 18
		testEndDateComponents.minute = 45
		
		testDistance = 50.0
		
		testDriver.AddTrip(StartTimeComponents: testStartDateComponents, EndTimeComponents: testEndDateComponents, Distance: testDistance)
		
		//5 hours with 50 miles traveled (10 mph)
		
		XCTAssert(testDriver.Distance == 60)
		XCTAssert(testDriver.Speed == 9)
	}
	
	func testDriverSummaryForNoMiles(){
		let testDriver = Driver(Name: "mrTest")
		let mrTestsString = testDriver.ResultsSummary()
		
		XCTAssert(mrTestsString == "mrTest: 0 miles")
	}
	
	func testDriverSummaryForSomeMiles(){
		let testDriver = Driver(Name: "mrTest")
		
		var testStartDateComponents = DateComponents()
		testStartDateComponents.hour = 2
		testStartDateComponents.minute = 30
		
		var testEndDateComponents = DateComponents()
		testEndDateComponents.hour = 4
		testEndDateComponents.minute = 30
		
		var testDistance:Float = 10.0
		
		testDriver.AddTrip(StartTimeComponents: testStartDateComponents, EndTimeComponents: testEndDateComponents, Distance: testDistance)
		
		//2 hours with 10 miles traveled (5 mph)

		let mrTestsString = testDriver.ResultsSummary()
		
		XCTAssert(mrTestsString == "mrTest: 10 miles @ 5mph")
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

