//
//  EnglishToKoreanUIViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class EnglishToKoreanUIViewController: UIViewController {
	@IBOutlet weak var outputLabel: UILabel!
	@IBOutlet weak var inputTextFieldEnglishToKorean: UITextField!
	@IBOutlet weak var acceptButton: UIButton!
	
	private var randIntNumber: Int = 666 //Default value for randIntNumber is 666
	private var acceptButtonStateContinue = false
	// Objects for default class
	let ObjDefaults = defaults()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		showKoreanRandomNum()
		inputTextFieldEnglishToKorean.delegate = self
		// Do any additional setup after loading the view.
	}
	
	@IBAction func acceptEnteredText(_ sender: Any) {
		let inputText = inputTextFieldEnglishToKorean.text!
		//Check if current title is Next or Check
		if(acceptButtonStateContinue) {
			resetToDefaultState()
			showKoreanRandomNum()
		} else {
			checkAnswerEnglishToKoreanNumbers(randNumber: randIntNumber, choice: inputText)
		}
	}
	
	func showKoreanRandomNum() {
		let numbersCreator = numbersCreatorFunctions()
		let randNumber = numbersCreator.randomNumber()
		// Return Label and button to default colors
		resetToDefaultState()
		outputLabel.text = String(randNumber)
		randIntNumber = randNumber
	}
	
	func checkAnswerEnglishToKoreanNumbers(randNumber: Int, choice: String) {
		// Check if English matchs Korean number
		let numbersCreator = numbersCreatorFunctions()
		let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
		var choice = " "
		choice = inputTextFieldEnglishToKorean.text!
		if(choice == String(koNumber)) {
			outputLabel.text = "That was the good answer"
			outputLabel.textColor = ObjDefaults.textColorGood
			acceptButton.setTitleColor(ObjDefaults.textColorGood, for: .normal)
			acceptButton.setTitle(ObjDefaults.nextTitleButton, for: .normal)
		} else {
			let returnWrongAnswer: String = "The good answer for \(koNumber) was \(randNumber)"
			outputLabel.text = returnWrongAnswer
			outputLabel.textColor = ObjDefaults.textColorWrong
			acceptButton.setTitleColor(ObjDefaults.textColorWrong, for: .normal)
			acceptButton.setTitle(ObjDefaults.nextTitleButton, for: .normal)
		}
		acceptButtonStateContinue = true
	}
	
	func resetToDefaultState() {
		// Wil reset UI to default state in colors and text
		acceptButton.setTitle(ObjDefaults.defaultTitleButton, for: .normal)
		acceptButton.setTitleColor(ObjDefaults.defaultTextColor, for: .normal)
		outputLabel.textColor = ObjDefaults.defaultTextColor
		inputTextFieldEnglishToKorean.text = ""
		acceptButtonStateContinue = false
	}
}

extension EnglishToKoreanUIViewController : UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
