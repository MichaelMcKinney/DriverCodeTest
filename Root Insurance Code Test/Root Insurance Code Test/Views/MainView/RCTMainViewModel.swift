//
//  RTCMainViewModel.swift
//  Root Insurance Code Test
//
//  Created by Michael McKinney on 8/24/18.
//  Copyright © 2018 Michael McKinney. All rights reserved.
//

import Foundation

class RCTMainViewModel {
	
	var Records:[Driver] = []
	var Results:String = ""
	
	let TestCommands = "Driver Dan\nDriver Alex\nDriver Bob\nTrip Dan 07:15 07:45 17.3\nTrip Dan 06:12 06:32 21.8\nTrip Alex 12:01 13:16 42.0"
	
	
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
		//TODO:
		
		//Parse Input by line
		let inputLines = Input.components(separatedBy:"\n")
		for line in inputLines{
			//Parse lines by command
			let commandsInLine = line.components(separatedBy: " ")
			if(commandsInLine[0] == "Driver"){
				Records.append(Driver(Name:commandsInLine[1]))
			}else if(commandsInLine[1] == "Trip"){
				//get start time command
				//get end time command
				//get distance command
				
			}
			
		}
		
		
		for driver in Records{
			Results += driver.Name
			Results += "\n"
		}
		
	
	}
}








