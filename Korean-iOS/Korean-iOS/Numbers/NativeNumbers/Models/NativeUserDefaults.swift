//
//  NativeUserDefaults.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-27.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class NativeUserDefaults: NSObject {
	let defaults = UserDefaults.standard
	
	// Keys strings
	let nativeMaxKey = "userDefaultsNativeMaxKey"
	let nativeMinKey = "userDefaultsNativeMinKey"
	let wasLaunchedBefore = "com.korean.FirstLaunch.WasLaunchedBefore"
	
	func saveMaxMin(maxTextField: UITextField, minTextField: UITextField) {
		defaults.set(textFieldToInt(fromtextField: maxTextField), forKey: nativeMaxKey)
		defaults.set(textFieldToInt(fromtextField: minTextField), forKey: nativeMinKey)
	}
	
	func nativeCheckMax() -> Int {
		let intMax = defaults.integer(forKey: nativeMaxKey)
		return intMax
	}
	
	func nativeCheckMin() -> Int {
		let intMin = defaults.integer(forKey: nativeMinKey)
		return intMin
	}
	
	func textFieldToInt(fromtextField: UITextField) -> Int {
		guard let text = fromtextField.text, let intNumber = Int(text) else {
			return 1
		}
		return intNumber
	}
}


