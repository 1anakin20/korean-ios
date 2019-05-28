//
//  NumberToKoreanViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-26.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class NativeNumberToKoreanViewController: UIViewController {
	@IBOutlet weak var nativeFieldText: UITextField!
	@IBOutlet weak var nativeAcceptButton: UIButton!
	@IBOutlet weak var nativeImage: UIImageView!
	@IBOutlet weak var nativeAnswerLabel: UILabel!
	
	// Default value randIntNumber is 888
	private var randIntNumber: Int = 888
	private var acceptButtonStateContinue = false
	
	// Objects
	private let answerReactions = correctOrWrong()
	private let objDefaults = textDefaults()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		acceptButtonStateContinue = answerReactions.resetToDefaultState(acceptButton: nativeAcceptButton, outputLabel: nativeAnswerLabel, inputTextFieldNumber: nativeFieldText, imageView: nativeImage)
		showKoreanRandomNum()
		
	}
	@IBAction func nativeAcceptButton(_ sender: Any) {
		let inputText = nativeFieldText.text!
		// Check if variable acceptButtonStateContinue is true to continue
		if(acceptButtonStateContinue) {
			acceptButtonStateContinue = answerReactions.resetToDefaultState(acceptButton: nativeAcceptButton, outputLabel: nativeAnswerLabel, inputTextFieldNumber: nativeFieldText, imageView: nativeImage)
			showKoreanRandomNum()
		} else {
			checkAnswerNativeNumberToKorean(randNumber: randIntNumber, choice: inputText)
		}
	}
	
	func showKoreanRandomNum() {
		let numbersCreator = NativeNumbersCreatorFunctions()
		let randNumber = numbersCreator.nativeRandomNumber()
		nativeAnswerLabel.text = String(randNumber)
		randIntNumber = randNumber
	}
	
	func checkAnswerNativeNumberToKorean(randNumber: Int, choice: String) {
		// Check if English matchs Korean number
		let numbersCreator = NativeNumbersCreatorFunctions()
		let koNumber = numbersCreator.native(number: randNumber)
		if(choice == String(koNumber)) {
			answerReactions.goodAnswer(outputLabel: nativeAnswerLabel, acceptButton: nativeAcceptButton, image: nativeImage)
		} else {
			answerReactions.wrongAnswer(outputLabel: nativeAnswerLabel, acceptButton: nativeAcceptButton, randNumber: randNumber, koNumber: String(koNumber), image: nativeImage)
		}
		acceptButtonStateContinue = true
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		nativeFieldText.resignFirstResponder()
	}
}

extension NativeNumberToKoreanViewController : UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		nativeAcceptButton(self)
		return true
	}
}
