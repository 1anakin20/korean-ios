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
	
	// Object
	let answerReaction = correctOrWrong()
	let ObjDefaults = textDefaults()
	let playSounds = sounds()
	
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
		if(choice == randKoNumber) {
			answerReaction.goodAnswer(outputLabel: outputLabelNumber, acceptButton: acceptButtonNumber)
		} else {
			answerReaction.wrongAnswer(outputLabel: outputLabelNumber, acceptButton: acceptButtonNumber, randNumber: randIntNumber, koNumber: koNumber)
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
