//
//  UserSettingsDefaults.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-20.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class UserSettingsDefaults: NSObject {
	let defaults = UserDefaults.standard
	
	// Keys strings
	let maxKey = "userDefaultsMaxKey"
	let minKey = "userDefaultsMinKey"
	let wasLaunchedBefore = "com.korean.FirstLaunch.WasLaunchedBefore"
	
	func saveMaxMin(maxTextField: UITextField, minTextField: UITextField) {
		defaults.set(textFieldToInt(fromtextField: maxTextField), forKey: maxKey)
		defaults.set(textFieldToInt(fromtextField: minTextField), forKey: minKey)
	}
	
	func checkMax() -> Int {
		let intMax = defaults.integer(forKey: maxKey)
		return intMax
	}
	
	func checkMin() -> Int {
		let intMin = defaults.integer(forKey: minKey)
		return intMin
	}
	
	func textFieldToInt(fromtextField: UITextField) -> Int {
		guard let text = fromtextField.text, let intNumber = Int(text) else {
			return 1
		}
		return intNumber
	}
}
