//
//  NativeNumbersCreatorFunctions.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-26.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class NativeNumbersCreatorFunctions: NSObject {
	// Functions values
	let intMax = UserSettingsDefaults().checkMax()
	let intMin = UserSettingsDefaults().checkMin()
	
	let koreanDigitNames = [0:"영",
							1:"하나",
							2:"둘",
							3:"셋",
							4:"넷",
							5:"다섯",
							6:"여섯",
							7:"일곱",
							8:"여덟",
							9:"아홉",
							100:"온",
		] as [Int : String]
	
	let nativeTenNames = [1:"열",
						  2:"스물",
						  3:"서른",
						  4:"마흔",
						  5:"쉰",
						  6:"예순",
						  7:"일흔",
						  8:"여든",
						  9:"아흔",
		] as [Int : String]
	
	func native(number: Int) -> String {
		let ten: Float = Float(number)/10
		if(number == 100) {
			return koreanDigitNames[100]!
		} else if(ten.truncatingRemainder(dividingBy: 1) == 0) {
			let tenNumber = number/10
			return nativeTenNames[tenNumber] ?? "Default value nativeTenNames"
		} else if(ten > 1) {
			let modulusNumber = number % 10
			let lastDigit = koreanDigitNames[modulusNumber] ?? "Default lastDigit value"
			let firstDigit = nativeTenNames[Int(ten)] ?? "Default firstDigit value"
			let composedNumber: String = firstDigit + lastDigit
			return composedNumber
		} else {
			return koreanDigitNames[number]!
		}
	}
}
