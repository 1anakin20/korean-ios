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
	
	// Default value randIntNumber
	private var randIntNumber: Int = 666
	private var acceptButtonStateContinue = false
	
	// Objects
	private let answerReactions = correctOrWrong()
	private let objDefaults = textDefaults()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		acceptButtonStateContinue = answerReactions.resetToDefaultState(acceptButton: nativeAcceptButton, outputLabel: nativeAnswerLabel, inputTextFieldNumber: nativeFieldText, imageView: nativeImage)
    }
	@IBAction func nativeAcceptButton(_ sender: Any) {
		
	}
}
