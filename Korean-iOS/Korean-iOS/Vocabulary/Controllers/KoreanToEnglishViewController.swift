//
//  KoreanToEnglishViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-28.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class KoreanToEnglishViewController: UIViewController {
	@IBOutlet weak var acceptButton: UIButton!
	@IBOutlet weak var showAnswerLabel: UILabel!
	@IBOutlet weak var image: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		image.isHidden = true
		showRandomWords()
		
	}
	
	@IBAction func acceptButtonPress(_ sender: Any) {
		
	}
	
	@IBAction func soundButtonPress(_ sender: Any) {
		
	}
	
	func showRandomWords() {
		let showRandomWords = randomWords()
		let rand = randomNumber(minInt: 0, maxInt: 2)
		showAnswerLabel.text = String(showRandomWords[rand]!.fields[0])
		print(showRandomWords)
	}
	
	func checkAnswer() {
		
	}
	
}
