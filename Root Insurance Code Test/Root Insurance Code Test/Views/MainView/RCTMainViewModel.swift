//
//  RTCMainViewModel.swift
//  Root Insurance Code Test
//
//  Created by Michael McKinney on 8/24/18.
//  Copyright © 2018 Michael McKinney. All rights reserved.
//

import Foundation

class RCTMainViewModel {
	
	var ParentView:RCTMainViewController
	
	var Records:[Driver] = []
	var Results:String = ""
	let TestCommands = "Driver Dan\nDriver Alex\nDriver Bob\nTrip Dan 07:15 07:45 17.3\nTrip Dan 06:12 06:32 21.8\nTrip Alex 12:01 13:16 42.0"
	
	//MARK: INITIALIZATION
	
	init(Parent:RCTMainViewController) {
		self.ParentView = Parent
	}
	
	//MARK: VIEW SUPPORT
	
	func ResetData(){
		self.Records = []
		self.Results = ""
	}
	
	func GetTestCommands() -> String{
		return self.TestCommands
	}
	
	func GetResults() -> String{
		return self.Results
	}
	
	func ProcessCommands(Input:String){
		
		//Parse Input by line
		let inputLines = Input.components(separatedBy:"\n")
		for line in inputLines{
			
			//Parse lines by command
			let commandsInLine = line.components(separatedBy: " ")
			
			//check that the command is complete
			if(commandsInLine.count < 2){
				//present an error to the user
				self.ParentView.PresentAlert(Title:"Command Error",Body:"There is a problem with the entered commands. Make sure they contain a valid command and any additional criteria. Load Test Commands for an example of acceptable input")
				continue
			}
			
			let driverName = commandsInLine[1]
			if(commandsInLine[0] == "Driver"){
				
				//Check for duplicate drivers
				if(!self.DoesDriverExist(Name: driverName)){
					//Add a new Driver
					Records.append(Driver(Name:driverName))
				}
				
			}else if(commandsInLine[0] == "Trip"){
				//if there aren't enough commands in the line
				if(commandsInLine.count < 5){
					//present an error to the user
					self.ParentView.PresentAlert(Title:"Trip Command Error",Body:"There is a problem with the entered \"Trip\" commands. Make sure they contain a name, a start time, an end time and a distance. Load Test Commands for an example of acceptable input")
					continue
				}
				
				//Make sure driver exists in records, or if they don't then make one
				let currentDriver = GetDriverFromRecordsWithName(DriverName: commandsInLine[1])
				let startTimeString = commandsInLine[2]
				let endTimeString = commandsInLine[3]
				let distanceString = commandsInLine[4]
				
				//check both time strings and distance string for validity
				if(!self.ValidTimeString(TimeString: endTimeString) || !self.ValidTimeString(TimeString: startTimeString) ||
					!self.ValidDistanceString(DistanceString: distanceString)){
					//skip this input line
					continue
				}
				
				let startTimeHoursMinutes:(String,String) = TimeStringComponentsFromTimeString(TimeString: startTimeString)
				let endTimeHoursMinutes:(String,String) = TimeStringComponentsFromTimeString(TimeString: endTimeString)
				
				let startTimeDateComponents = DateComponentsFromHoursMinutes(Hours: startTimeHoursMinutes.0,
																			 Minutes: startTimeHoursMinutes.1)
				let endTimeDateComponents = DateComponentsFromHoursMinutes(Hours: endTimeHoursMinutes.0,
																		   Minutes: endTimeHoursMinutes.1)
				if let distanceFloat = Float(distanceString){
					currentDriver.AddTrip(StartTimeComponents: startTimeDateComponents, EndTimeComponents: endTimeDateComponents, Distance: distanceFloat)
				}else{
					//invalid distance string, skip this input line
					continue
				}
				
			}else{
				//Ignore unrecognized commands
				self.ParentView.PresentAlert(Title:"Unrecognized Command Error",Body:"There is a problem with the entered commands. Make sure they contain a valid \"Driver\" or \"Trip\" command. Load Test Commands for an example of acceptable input")
				continue
			}
		}
		
		self.UpdateResults()
	}
	
	func UpdateResults(){
		Records.sort(by: { $0.Distance > $1.Distance })
		Results = ""
		
		for driver in Records{
			Results += driver.ResultsSummary()
			Results += "\n"
		}
		/*
		Alex: 42 miles @ 34 mph
		Dan: 39 miles @ 47 mph
		Bob: 0 miles
		*/
	}	
	
	//MARK: DRIVER UTILITY
	
	func GetDriverFromRecordsWithName(DriverName: String) -> Driver{
		for driver in Records{
			if (driver.Name == DriverName){
				return driver
			}
		}
		//if no driver with that name exists, create it then return it
		Records.append(Driver(Name: DriverName))
		return GetDriverFromRecordsWithName(DriverName:DriverName)
	}
	
	func DoesDriverExist(Name: String) -> Bool{
		for driver in Records{
			if(driver.Name == Name){
				return true
			}
		}
		return false
	}
	
	//MARK: VALIDATION
	
	func ValidTimeString(TimeString: String) -> Bool{
		return (TimeString.range(of: "[0-1][0-9]:[0-5][0-9]", options: .regularExpression) != nil)
	}
	
	func ValidDistanceString(DistanceString: String) -> Bool{
		if let _: Float = Float(DistanceString){
			return true
		}
		return false
	}
	
	//MARK: DATA MANIPULATION
	
	func TimeStringComponentsFromTimeString(TimeString:String) -> (String,String){
		let stringsToReturn = TimeString.components(separatedBy: ":")
		return (stringsToReturn[0],stringsToReturn[1])
	}
	
	func DateComponentsFromHoursMinutes(Hours:String, Minutes: String) -> DateComponents{
		var componentsToReturn = DateComponents()
		
		if let hoursInt = Int(Hours){
			if let minutesInt = Int(Minutes){
				componentsToReturn.hour = hoursInt
				componentsToReturn.minute = minutesInt
			}
		}
		
		return componentsToReturn
	}
	
	
	
	
	
	
}








