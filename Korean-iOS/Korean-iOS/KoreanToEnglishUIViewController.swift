//
//  KoreanToEnglishUIViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class KoreanToNumberUIViewController: UIViewController {
	@IBOutlet weak var outputLabelNumber: UILabel!
	@IBOutlet weak var inputFieldNumber: UITextField!
	@IBOutlet weak var acceptButtonNumber: UIButton!
	
	//Private variables
	private var randIntNumber = 777 //Default value
	private var acceptButtonNumberStateContinue = false
	// Object for default class
	let ObjDefaults = defaults()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		resetToDefaultState()
		showKoreanRandomNum()
	}
	
	@IBAction func acceptEnteredNumber(_ sender: UIButton) {
		let inputText = inputFieldNumber.text!
		// Check is variable acceptButtonNumberStateContinue is true to continue
		if(acceptButtonNumberStateContinue) {
			resetToDefaultState()
			showKoreanRandomNum()
		} else {
			checkAnswerKoreanToNumber(choice: inputText, randKoNumber: String(randIntNumber))
		}
	}
	
	func showKoreanRandomNum() {
		let numbersCreator = numbersCreatorFunctions()
		let randNumber = numbersCreator.randomNumber()
		let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
		outputLabelNumber.text = koNumber
		randIntNumber = randNumber
	}
	
	func checkAnswerKoreanToNumber(choice: String, randKoNumber: String) {
		// Check if Korean matchs English number
		let numbersCreator = numbersCreatorFunctions()
		let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randIntNumber)
		var choice = " "
		choice = inputFieldNumber.text!
		if(choice == randKoNumber) {
			outputLabelNumber.text = "That was the good answer"
			outputLabelNumber.textColor = ObjDefaults.textColorGood
			acceptButtonNumber.setTitleColor(ObjDefaults.textColorGood, for: .normal)
			acceptButtonNumber.setTitle(ObjDefaults.nextTitleButton, for: .normal)
		} else {
			let returnWrongAnswer: String = "The good answer for \(koNumber) was \(randIntNumber)"
			outputLabelNumber.text = returnWrongAnswer
			outputLabelNumber.textColor = ObjDefaults.textColorWrong
			acceptButtonNumber.setTitleColor(ObjDefaults.textColorWrong, for: .normal)
			acceptButtonNumber.setTitle(ObjDefaults.nextTitleButton, for: .normal)
		}
		acceptButtonNumberStateContinue = true
	}
	
	func resetToDefaultState() {
		// Wil reset UI to default state in colors and text
		acceptButtonNumber.setTitle(ObjDefaults.defaultTitleButton, for: .normal)
		acceptButtonNumber.setTitleColor(ObjDefaults.defaultTextColor, for: .normal)
		outputLabelNumber.textColor = ObjDefaults.defaultTextColor
		inputFieldNumber.text = ""
		acceptButtonNumberStateContinue = false
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		inputFieldNumber.resignFirstResponder()
	}
}
