//
//  EnglishToKoreanUIViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class SinoNumberToKoreanUIViewController: UIViewController {
	@IBOutlet weak var outputLabel: UILabel!
	@IBOutlet weak var inputTextFieldNumberToKorean: UITextField!
	@IBOutlet weak var acceptButton: UIButton!
	@IBOutlet weak var imageView: UIImageView!
	
	//Default value for randIntNumber is 666
	private var randIntNumber: Int = 666
	private var acceptButtonStateContinue = false
	
	// Objects
	let answerReaction = correctOrWrong()
	let ObjDefaults = textDefaults()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		//Make view to defaults
		acceptButtonStateContinue = answerReaction.resetToDefaultState(acceptButton: acceptButton, outputLabel: outputLabel, inputTextFieldNumber: inputTextFieldNumberToKorean, imageView: imageView)
		showKoreanRandomNum()
		inputTextFieldNumberToKorean.delegate = self
	}
	
	@IBAction func acceptEnteredText(_ sender: Any) {
		let inputText = inputTextFieldNumberToKorean.text!
		// Check if variable acceptButtonStateContinue is true to continue
		if(acceptButtonStateContinue) {
			acceptButtonStateContinue = answerReaction.resetToDefaultState(acceptButton: acceptButton, outputLabel: outputLabel, inputTextFieldNumber: inputTextFieldNumberToKorean, imageView: imageView)
			showKoreanRandomNum()
		} else {
			checkAnswerNumberToKorean(randNumber: randIntNumber, choice: inputText)
		}
	}
	
	func showKoreanRandomNum() {
		let numbersCreator = SinoNumbersCreatorFunctions()
		let randNumber = numbersCreator.randomNumber()
		outputLabel.text = String(randNumber)
		randIntNumber = randNumber
	}
	
	func checkAnswerNumberToKorean(randNumber: Int, choice: String) {
		// Check if English matchs Korean number
		let numbersCreator = SinoNumbersCreatorFunctions()
		let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
		if(choice == String(koNumber)) {
			answerReaction.goodAnswer(outputLabel: outputLabel, acceptButton: acceptButton, image: imageView)
		} else {
			answerReaction.wrongAnswer(outputLabel: outputLabel, acceptButton: acceptButton, randNumber: randNumber, koNumber: String(koNumber), image: imageView)
		}
		acceptButtonStateContinue = true
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		inputTextFieldNumberToKorean.resignFirstResponder()
	}
}

extension SinoNumberToKoreanUIViewController : UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		acceptEnteredText(self)
		return true
	}
}
