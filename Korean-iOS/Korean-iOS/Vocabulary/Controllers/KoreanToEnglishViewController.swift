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
	
	// Objects
	let parser = jsonParser()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	@IBAction func acceptButtonPress(_ sender: Any) {
		// For debuggin purposes
		print(parser.parseJson())
	}
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
