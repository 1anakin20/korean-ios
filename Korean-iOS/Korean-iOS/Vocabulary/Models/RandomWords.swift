//
//  RandomWords.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-09-20.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//
// This will choose random words for the vocabulary

import Foundation

func randomWords() {
	let arrayOfWords = parseJson()
	let firstArray = arrayOfWords.randomElement()
	let secondArray = arrayOfWords.randomElement()
	let thirdArray = arrayOfWords.randomElement()
}
