//
//  RandomWords.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-09-20.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//
// This will choose random words for the vocabulary

import Foundation

func randomWords() -> [Int : koreanWordsJson] {
	let arrayOfWords = parseJson()
	var randomWordsDic: [Int : koreanWordsJson] = [:]
	for i in 0..<3 {
		randomWordsDic[i] = arrayOfWords.randomElement()
	}
	return randomWordsDic
}
