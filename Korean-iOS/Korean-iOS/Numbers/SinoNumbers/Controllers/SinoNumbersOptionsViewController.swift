//
//  SettingsViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-20.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class SinoNumbersOptionsViewController: UIViewController {
	@IBOutlet weak var maxTextField: UITextField!
	@IBOutlet weak var minTextField: UITextField!
	
	// Objects
	let intMax = UserSettingsDefaults().checkMax()
	let intMin = UserSettingsDefaults().checkMin()
	let userDefaults = UserSettingsDefaults()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		showUserSettingsTextFields()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		// Save user preferences
		saveUserPreferences()
	}
	
	func showUserSettingsTextFields() {
		maxTextField.text = String(intMax)
		minTextField.text = String(intMin)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		maxTextField.resignFirstResponder()
		minTextField.resignFirstResponder()
		saveUserPreferences()
	}
	
	func saveUserPreferences() {
		userDefaults.saveMaxMin(maxTextField: maxTextField, minTextField: minTextField)
	}
}
