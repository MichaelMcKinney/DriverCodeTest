//
//  ViewController.swift
//  Root Insurance Code Test
//
//  Created by Michael McKinney on 8/22/18.
//  Copyright © 2018 Michael McKinney. All rights reserved.
//

import UIKit

class RCTMainViewController: UIViewController {
	
	//MARK: PROPERTIES
	
	@IBOutlet weak var LoadCommandsButton: UIButton!
	
	@IBOutlet weak var RunCommandsButton: UIButton!
	
	@IBOutlet weak var ResetCommandsButton: UIButton!

	@IBOutlet weak var CommandsTextView: UITextView!
	
	@IBOutlet weak var ResultsTextView: UITextView!
	
	let ViewModel:RCTMainViewModel = RCTMainViewModel()

	//MARK: INITIALIZATION
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.BindViewModel()
		self.SetupUI()
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func BindViewModel(){
		//Perform any preparation on the ViewModel
		
	}
	
	func SetupUI(){
		//Prepare any UI elements for first use
		self.CommandsTextView.text = ""
		self.ResultsTextView.text = ""
	}
	
	//MARK: BUTTON COMMANDS
	
	@IBAction func DidSelectLoadTestCommands(_ sender: Any) {
		self.CommandsTextView.text = self.ViewModel.GetTestCommands()
	}
	
	@IBAction func DidSelectRunCommands(_ sender: Any) {
		self.ProcessCommands()
		self.PresentResults()
	}
	
	@IBAction func DidSelectReset(_ sender: Any) {
		self.ViewModel.ResetData()
		self.SetupUI()
	}
	
	//MARK: ALGORITHM
	
	func ProcessCommands(){
		self.ViewModel.ProcessCommands(Input: self.CommandsTextView.text)
	}
	
	func PresentResults(){
		self.ResultsTextView.text = ViewModel.GetResults()
	}
}



