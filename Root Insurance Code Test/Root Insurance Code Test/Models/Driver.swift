//
//  Driver.swift
//  Root Insurance Code Test
//
//  Created by Michael McKinney on 8/24/18.
//  Copyright © 2018 Michael McKinney. All rights reserved.
//

import Foundation

class Driver {
	let Name:String
	var Distance:Int = 0
	var Speed:Int = 0
	
	init(Name:String) {
		self.Name = Name
		self.Distance = 0
		self.Speed = 0
	}
	
	func AddTrip(StartTimeComponents:DateComponents, EndTimeComponents:DateComponents, Distance:Float){
		
		//find total minutes between start and end times
		let calendar = Calendar.current
		let startDate = calendar.date(from: StartTimeComponents)!
		let endDate = calendar.date(from: EndTimeComponents)!
		let differenceMinutes = endDate.timeIntervalSince(startDate)/60
		
		//find miles per hour
		let milesPerHour = (Double(Distance)/differenceMinutes) * 60
		
		if(milesPerHour > 100 || milesPerHour < 5){
			//throw out trips faster than 100 mph and slower than 5 mph
			return
		}
		
		//find new average speed
		let totalDist = Float(self.Distance) + Distance
		
		let newAvgSpeed = ((Float(self.Distance)/totalDist) * Float(self.Speed)) + ((Distance/totalDist) * Float(milesPerHour))
		
		//set new driver details
		self.Speed = Int(round(newAvgSpeed))
		self.Distance = Int(round(totalDist))
		
		//Debug printing to make sure everything is running smoothly
		//print(self.ResultsSummary())
	}
	
	func ResultsSummary() -> String{
		var test:String = ""
		if(self.Distance > 0){
			test = String(format: "%@: %d miles @ %dmph", self.Name, self.Distance, self.Speed)
			return test
		}
		test = String(format: "%@: %d miles", self.Name, self.Distance)
		return test
	}
	
}
