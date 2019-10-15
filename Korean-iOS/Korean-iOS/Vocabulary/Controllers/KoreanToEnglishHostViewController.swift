//
//  KoreanToEnglishHostViewController.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-10-15.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit
import SwiftUI

class KoreanToEnglishHostViewController: UIViewController {
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	@IBSegueAction func showEnglishToKoreanSwiftUI(_ coder: NSCoder) -> UIViewController? {
		return UIHostingController(coder: coder, rootView: KoreanToEnglishSwiftUI())
	}
}
