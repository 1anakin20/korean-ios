//
//  EnglishToKoreanUIViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class NumberToKoreanUIViewController: UIViewController {
	@IBOutlet weak var outputLabel: UILabel!
	@IBOutlet weak var inputTextFieldNumberToKorean: UITextField!
	@IBOutlet weak var acceptButton: UIButton!
	
	private var randIntNumber: Int = 666 //Default value for randIntNumber is 666
	private var acceptButtonStateContinue = false
	
	// Objects
	let answerReaction = correctOrWrong()
	let ObjDefaults = textDefaults()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		//Make view to defaults
		resetToDefaultState()
		showKoreanRandomNum()
		inputTextFieldNumberToKorean.delegate = self
	}
	
	@IBAction func acceptEnteredText(_ sender: Any) {
		let inputText = inputTextFieldNumberToKorean.text!
		// Check if variable acceptButtonStateContinue is true to continue
		if(acceptButtonStateContinue) {
			resetToDefaultState()
			showKoreanRandomNum()
		} else {
			checkAnswerNumberToKorean(randNumber: randIntNumber, choice: inputText)
		}
	}
	
	func showKoreanRandomNum() {
		let numbersCreator = numbersCreatorFunctions()
		let randNumber = numbersCreator.randomNumber()
		outputLabel.text = String(randNumber)
		randIntNumber = randNumber
	}
	
	func checkAnswerNumberToKorean(randNumber: Int, choice: String) {
		// Check if English matchs Korean number
		let numbersCreator = numbersCreatorFunctions()
		let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
		if(choice == String(koNumber)) {
			answerReaction.goodAnswer(outputLabel: outputLabel, acceptButton: acceptButton)
		} else {
			answerReaction.wrongAnswer(outputLabel: outputLabel, acceptButton: acceptButton, randNumber: randNumber, koNumber: String(koNumber))
		}
		acceptButtonStateContinue = true
	}
	
	func resetToDefaultState() {
		// Wil reset UI to default state in colors and text
		acceptButton.setTitle(ObjDefaults.defaultTitleButton, for: .normal)
		acceptButton.setTitleColor(ObjDefaults.defaultTextColor, for: .normal)
		outputLabel.textColor = ObjDefaults.defaultTextColor
		inputTextFieldNumberToKorean.text = ""
		acceptButtonStateContinue = false
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		inputTextFieldNumberToKorean.resignFirstResponder()
	}
}

extension NumberToKoreanUIViewController : UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		acceptEnteredText(self)
		return true
	}
}
