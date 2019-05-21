//
//  images.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-20.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class images: NSObject {
	// Arrays of images
	public let grandmaImages: [String] = [
		"grandma1.png",
		"grandma2.png",
		"grandma3.png",
		"grandma4.png",
		"grandma5.jpg",
	]
	
	public let grandpaImages: [String] = [
		"grandpa1.jpg",
		"grandpa2.jpj",
		"grandpa3.jpg",
	]
	
	func randomImage(imageArray: [String]) -> String {
		guard let randomImage = imageArray.shuffled().randomElement() else {
			return "media-offline.jpg"
		}
		return randomImage
	}
	
	
}
