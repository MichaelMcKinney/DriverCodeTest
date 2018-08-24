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
				
				//TODO:
				//get start time command
				//get end time command
				//get distance command
				
			}else{
				//Ignore unrecognized commands
			}
			
		}
		
		
		for driver in Records{
			Results += driver.Name
			Results += "\n"
		}
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








