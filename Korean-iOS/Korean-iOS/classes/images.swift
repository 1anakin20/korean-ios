//
//  images.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-20.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class images: NSObject {
	let grandmaImages = [
		"grandma1.png",
		"grandma2.png",
		"grandma3.png",
		"grandma4.png",
	]
	
	func randomImage() -> String {
		guard let randomImage = grandmaImages.shuffled().randomElement() else {
			return "grandma1.png"
		}
		return randomImage
	}
}
