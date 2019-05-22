//
//  correctOrWrong.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-20.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class correctOrWrong: NSObject {
	// Objects
	let ObjDefaults = textDefaults()
	let playSounds = sounds()
	let randomImage = images()

	func goodAnswer(outputLabel: UILabel, acceptButton: UIButton, image: UIImageView) {
		outputLabel.text = "That was the good answer"
		outputLabel.textColor = ObjDefaults.textColorGood
		acceptButton.setTitleColor(ObjDefaults.textColorGood, for: .normal)
		acceptButton.setTitle(ObjDefaults.nextTitleButton, for: .normal)
		image.image = randomImage.randomGrandma(imagesChoice: "grandma")
		image.isHidden = false
		playSounds.playCorrectSound()
	}
	
	func wrongAnswer(outputLabel: UILabel, acceptButton: UIButton, randNumber: Int, koNumber: String, image: UIImageView) {
		let returnWrongAnswer: String = "The good answer for \(randNumber) was \(koNumber)"
		outputLabel.text = returnWrongAnswer
		outputLabel.textColor = ObjDefaults.textColorWrong
		acceptButton.setTitleColor(ObjDefaults.textColorWrong, for: .normal)
		acceptButton.setTitle(ObjDefaults.nextTitleButton, for: .normal)
		image.image = randomImage.randomGrandma(imagesChoice: "grandpa")
		image.isHidden = false
		playSounds.playIncorrectSound()
	}
	func resetToDefaultState(acceptButton: UIButton, outputLabel: UILabel, inputTextFieldNumber: UITextField, imageView: UIImageView) -> Bool {
		// Wil reset UI to default state in colors and text
		acceptButton.setTitle(ObjDefaults.defaultTitleButton, for: .normal)
		acceptButton.setTitleColor(ObjDefaults.defaultTextColor, for: .normal)
		outputLabel.textColor = ObjDefaults.defaultTextColor
		inputTextFieldNumber.text = ""
		imageView.isHidden = true
		
		// acceptButtonStateContinue
		return false
	}
}
