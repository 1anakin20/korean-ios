//
//  NativeOptionsViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-26.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class NativeOptionsViewController: UIViewController {
	@IBOutlet weak var nativeMaxTextField: UITextField!
	@IBOutlet weak var nativeMinTextField: UITextField!
	
	// Objects
	let nativeIntMax = NativeUserDefaults().nativeCheckMax()
	let nativeIntMin = NativeUserDefaults().nativeCheckMin()
	let nativeUserDefaults = NativeUserDefaults()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		nativeShowUserSettings()
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		// Save user preferences
		nativeSaveUserPreferences()
	}
	
	func nativeShowUserSettings() {
		nativeMaxTextField.text = String(nativeIntMax)
		nativeMinTextField.text = String(nativeIntMin)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		nativeMaxTextField.resignFirstResponder()
		nativeMinTextField.resignFirstResponder()
		nativeSaveUserPreferences()
	}
	
	func nativeSaveUserPreferences() {
		nativeUserDefaults.saveMaxMin(maxTextField: nativeMaxTextField, minTextField: nativeMinTextField)
	}
}
