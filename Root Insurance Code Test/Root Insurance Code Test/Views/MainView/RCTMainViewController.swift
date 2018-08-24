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
	
	var ViewModel:RCTMainViewModel?

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
		self.ViewModel = RCTMainViewModel(Parent:self)
	}
	
	func SetupUI(){
		//Prepare any UI elements for first use
		self.CommandsTextView.text = ""
		self.ResultsTextView.text = ""
		
		let tapGesture = UITapGestureRecognizer(target: self, action:#selector(self.dismissKeyboard))
		self.view.addGestureRecognizer(tapGesture)
	}
	
	//MARK: BUTTON COMMANDS
	
	@IBAction func DidSelectLoadTestCommands(_ sender: Any) {
		self.dismissKeyboard()
		if let testCommands = self.ViewModel?.GetTestCommands(){
			self.CommandsTextView.text = testCommands
		}
	}
	
	@IBAction func DidSelectRunCommands(_ sender: Any) {
		self.dismissKeyboard()
		self.ProcessCommands()
		self.PresentResults()
	}
	
	@IBAction func DidSelectReset(_ sender: Any) {
		self.dismissKeyboard()
		self.ViewModel?.ResetData()
		self.SetupUI()
	}
	
	@objc func dismissKeyboard () {
		self.view.endEditing(true)
	}
	
	//MARK: ALGORITHM
	
	func ProcessCommands(){
		self.ViewModel?.ProcessCommands(Input: self.CommandsTextView.text)
	}
	
	func PresentResults(){
		if let resultsText = ViewModel?.GetResults(){
			self.ResultsTextView.text = resultsText
		}else{
			self.ResultsTextView.text = ""
		}
	}
	
	//MARK: ALERTS
	
	func PresentAlert(Title:String, Body:String){
		let alert = UIAlertController(title: Title, message: Body, preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
}



