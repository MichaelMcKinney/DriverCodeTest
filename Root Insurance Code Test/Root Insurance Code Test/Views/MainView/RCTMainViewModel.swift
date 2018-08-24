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
	
	init(Parent:RCTMainViewController) {
		self.ParentView = Parent
	}
	
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
				return
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
					return
				}
				
				//Make sure driver exists in records
				if(!self.DoesDriverExist(Name: driverName)){
					//If no driver add one
					Records.append(Driver(Name:driverName))
				}
				
				let startTimeString = commandsInLine[2]
				let endTimeString = commandsInLine[3]
				let distanceString = commandsInLine[4]
				
				let startTimeHoursMinutes:(String,String) = TimeStringComponentsFromTimeString(TimeString: startTimeString)
				let endTimeHoursMinutes:(String,String) = TimeStringComponentsFromTimeString(TimeString: endTimeString)
				
				if(stringComponents.count < 2){
					//time is incomplete, skip this iteration of the loop
					continue
				}
				
				let startTimeComponents = self.DateComponentsFromTimeString(TimeString: startTimeString)
				let endTimeComponents = self.DateComponentsFromTimeString(TimeString: endTimeString)
				
				
				//turn start / end time minutes and hours into DateComponents
				
				//add trip to driver
				
				
			}else{
				//Ignore unrecognized commands
				self.ParentView.PresentAlert(Title:"Unrecognized Command Error",Body:"There is a problem with the entered commands. Make sure they contain a valid \"Driver\" or \"Trip\" command. Load Test Commands for an example of acceptable input")
				return
			}
			
		}
		
		
		for driver in Records{
			Results += driver.Name
			Results += "\n"
		}
	}
	
	func TimeStringComponentsFromTimeString(TimeString:String) -> (String,String){
		let stringsToReturn = TimeString.components(separatedBy: ":")
		if(stringsToReturn.count < 2){
			return ("00","00")
		}
		return (stringsToReturn[0],stringsToReturn[1])
	}
	
	func DateComponentsFromHoursMinutes(MinuteString:String, HourString) -> DateComponents{
		let calendar = Calendar.current
		let componentsToReturn = DateComponents()

		
		componentsToReturn.hour =
	}
	
	func DoesDriverExist(Name: String) -> Bool{
		for driver in Records{
			if(driver.Name == Name){
				return true
			}
		}
		return false
	}
}








