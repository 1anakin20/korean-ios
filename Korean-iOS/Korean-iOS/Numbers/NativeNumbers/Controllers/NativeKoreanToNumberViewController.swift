//
//  KoreanToNumberViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-26.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class NativeKoreanToNumberViewController: UIViewController {
	@IBOutlet weak var nativeNumberImage: UIImageView!
	@IBOutlet weak var nativeNumberLabel: UILabel!
	@IBOutlet weak var nativeTextFieldNumber: UITextField!
	@IBOutlet weak var nativeAcceptButtonNumber: UIButton!
	
	//Private variables
	//Default value
	private var randIntNumber = 999
	private var acceptButtonNumberStateContinue = false
	
	// Objects
	let answerReaction = correctOrWrong()
	let objDefaults = textDefaults()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		acceptButtonNumberStateContinue = answerReaction.resetToDefaultState(acceptButton: nativeAcceptButtonNumber, outputLabel: nativeNumberLabel, inputTextFieldNumber: nativeTextFieldNumber, imageView: nativeNumberImage)
		showNativeKoreanNumber()
	}
	
	@IBAction func acceptButton(_ sender: Any) {
		let inputText = nativeTextFieldNumber.text!
		// Check if varible acceptButtonNumber is true to continue
		if(acceptButtonNumberStateContinue) {
			acceptButtonNumberStateContinue = answerReaction.resetToDefaultState(acceptButton: nativeAcceptButtonNumber, outputLabel: nativeNumberLabel, inputTextFieldNumber: nativeTextFieldNumber, imageView: nativeNumberImage)
			showNativeKoreanNumber()
		} else {
			checkNativeKoreanNumber(choice: inputText, randKoNumber: String(randIntNumber))
		}
	}
	
	func showNativeKoreanNumber() {
		let numberCreator = NativeNumbersCreatorFunctions()
		let randNumber = numberCreator.nativeRandomNumber()
		let nativeKoNumber = numberCreator.native(number: randNumber)
		nativeNumberLabel.text = nativeKoNumber
		randIntNumber = randNumber
	}
	
	func checkNativeKoreanNumber(choice: String, randKoNumber: String) {
		// Check if korean matchs English number
		// Maybe the god that creates numbers is NativeNumbersCreatorFunctions() 🤔
		let numbersCreator = NativeNumbersCreatorFunctions()
		let koNumber = numbersCreator.native(number: randIntNumber)
		if(choice == randKoNumber) {
			answerReaction.goodAnswer(outputLabel: nativeNumberLabel, acceptButton: nativeAcceptButtonNumber, image: nativeNumberImage)
		} else {
			answerReaction.wrongAnswer(outputLabel: nativeNumberLabel, acceptButton: nativeAcceptButtonNumber, firstOutput: String(koNumber), secondOutput: String(randIntNumber), image: nativeNumberImage)
		}
		acceptButtonNumberStateContinue = true
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		nativeTextFieldNumber.resignFirstResponder()
	}
}
