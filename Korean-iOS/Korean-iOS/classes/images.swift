//
//  images.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-20.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class images: NSObject {
	// Variables for image number
	let grandmaTotalImages = 4
	let grandpaTotalImages = 3
	
	func imageChoice(imagesChoice: String) -> UIImage {
		var maxImages = 1
		if(imagesChoice == "grandma") {
			maxImages = grandmaTotalImages
		} else if(imagesChoice == "grandpa") {
			maxImages = grandpaTotalImages
		} else {
			maxImages = 1
			print("Error imagesChoice was set to default 1")
		}
		guard let randomImage = UIImage(named: "\(imagesChoice)\(arc4random_uniform(UInt32(maxImages)) + 1).png") else {
			return UIImage(named: "media-offline.jpg")!
		}
		return randomImage
	}
}
