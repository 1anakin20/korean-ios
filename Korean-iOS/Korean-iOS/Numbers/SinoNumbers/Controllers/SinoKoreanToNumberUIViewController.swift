//
//  KoreanToEnglishUIViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class SinoKoreanToNumberUIViewController: UIViewController {
	@IBOutlet weak var outputLabelNumber: UILabel!
	@IBOutlet weak var inputFieldNumber: UITextField!
	@IBOutlet weak var acceptButtonNumber: UIButton!
	@IBOutlet weak var imageView: UIImageView!
	
	//Private variables
	//Default value
	private var randIntNumber = 777
	private var acceptButtonNumberStateContinue = false
	
	// Object
	let answerReaction = correctOrWrong()
	let ObjDefaults = textDefaults()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		acceptButtonNumberStateContinue = answerReaction.resetToDefaultState(acceptButton: acceptButtonNumber, outputLabel: outputLabelNumber, inputTextFieldNumber: inputFieldNumber, imageView: imageView)
		showKoreanRandomNum()
	}
	
	@IBAction func acceptEnteredNumber(_ sender: UIButton) {
		let inputText = inputFieldNumber.text!
		// Check is variable acceptButtonNumberStateContinue is true to continue
		if(acceptButtonNumberStateContinue) {
			acceptButtonNumberStateContinue = answerReaction.resetToDefaultState(acceptButton: acceptButtonNumber, outputLabel: outputLabelNumber, inputTextFieldNumber: inputFieldNumber, imageView: imageView)
			showKoreanRandomNum()
		} else {
			checkAnswerKoreanToNumber(choice: inputText, randKoNumber: String(randIntNumber))
		}
	}
	
	func showKoreanRandomNum() {
		let numbersCreator = SinoNumbersCreatorFunctions()
		let randNumber = numbersCreator.randomNumber()
		let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
		outputLabelNumber.text = koNumber
		randIntNumber = randNumber
	}
	
	func checkAnswerKoreanToNumber(choice: String, randKoNumber: String) {
		// Check if Korean matchs English number
		let numbersCreator = SinoNumbersCreatorFunctions()
		let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randIntNumber)
		if(choice == randKoNumber) {
			answerReaction.goodAnswer(outputLabel: outputLabelNumber, acceptButton: acceptButtonNumber, image: imageView)
		} else {
			answerReaction.wrongAnswer(outputLabel: outputLabelNumber, acceptButton: acceptButtonNumber, firstOutput: koNumber, secondOutput: String(randIntNumber), image: imageView)
		}
		acceptButtonNumberStateContinue = true
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		inputFieldNumber.resignFirstResponder()
	}
}
