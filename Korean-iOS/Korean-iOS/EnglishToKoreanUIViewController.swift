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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		inputTextFieldEnglishToKorean.delegate = self
		// Do any additional setup after loading the view.
	}
	
	@IBAction func acceptEnteredText(_ sender: Any) {
		let inputText = inputTextFieldEnglishToKorean.text!
		checkAnswerEnglishToKoreanNumbers(randNumber: showKoreanRandomNum(), choice: inputText)
	}
	
	func showKoreanRandomNum() -> Int {
		let numbersCreator = numbersCreatorFunctions()
		let randNumber = numbersCreator.randomNumber()
		let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
		outputLabel.text = koNumber
		return randNumber
	}
	
	func checkAnswerEnglishToKoreanNumbers(randNumber: Int, choice: String) {
		// Check if English matchs Korean number
		let numbersCreator = numbersCreatorFunctions()
		let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
		var choice = " "
		choice = inputTextFieldEnglishToKorean.text!
		if(choice == String(randNumber)) {
			outputLabel.text = "That was the good answer"
		} else {
			let returnWrongAnswer: String = "The good answer for \(koNumber) was \(randNumber)"
			outputLabel.text = returnWrongAnswer
		}
	}
}

extension EnglishToKoreanUIViewController : UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
