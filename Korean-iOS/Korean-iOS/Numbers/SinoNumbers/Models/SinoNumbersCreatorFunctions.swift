//
//  numbersFunctions.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-18.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class SinoNumbersCreatorFunctions: NSObject {
	// Functions values
	let intMax = UserSettingsDefaults().checkMax()
	let intMin = UserSettingsDefaults().checkMin()
	
	let koreanDigitNames = [0:"영",
							1:"일",
							2:"이",
							3:"삼",
							4:"사",
							5:"오",
							6:"육",
							7:"칠",
							8:"팔",
							9:"구",
		] as [Int : String]
	

	
	func randomNumber() -> Int {
		let randomNum = Int.random(in: intMin...intMax)
		return randomNum
	}
	
	let koreanPoweString = [0:"", 1:"십", 2:"백",3:"천", 4:"만", 5:"십", 6:"백", 7:"천", 8:"억", 9:"십", 10:"백", 11:"천", 12:"조", 13:"십", 14:"백", 15:"천"]
	
	func koreanString(number: Int, base:Int, maxPower: Int, originalNumber:Int) -> String {
		if(number%10 != 0) {
			let digitToString = koreanDigitNames[number%10]!
			return  number%10 != 1  ? digitToString + koreanPoweString[base]!: base != 0 && base != 4 && base != 8 && base != 12 ? koreanPoweString[base]!:base == 4 && (originalNumber%(10^8) < (10^5)) ? koreanPoweString[base]! : base == 8 && (originalNumber%(10^12) < (10^9)) ? koreanPoweString[base]!: base == 12 && (originalNumber%(10^16) < (10^13)) ? koreanPoweString[base]! : base != 0 ? digitToString + koreanPoweString[base]!:digitToString
		}else {
			return base == 4 && (originalNumber%(10^8) > (10^4)) ? "만": base == 8 && (originalNumber%(10^12) > (10^8)) ? "억" : base == 12 && (originalNumber%(10^16) > (10^12)) ? "조" :""
		}
		
	}
	
	func numberDecimaltoStringKorean(decimalNumber:Int) -> String {
		var output = ""
		var number = decimalNumber
		var power: Int = 0
		let lenght:Int = Int(log10(Float(decimalNumber)))
		if number/10<1 && number == 0 {
			output = koreanDigitNames[number%10]!
		}else{
			while number > 0 {
				output = koreanString(number: number, base: power, maxPower: lenght, originalNumber: decimalNumber) + output
				power += 1
				number /= 10
			}
		}
		return output
	}
}
