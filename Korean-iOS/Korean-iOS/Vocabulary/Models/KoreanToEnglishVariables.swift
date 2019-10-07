//
//  KoreanToEnglishVariables.swift
//  Korean-iOS
//
//  Created by tomas Daniel Nieto on 2019-10-04.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import Foundation
import Combine


//// Initalizing empty variables which will be assigned later in assignedVariables()
//var dic: [Int : koreanWordsJson] = [:]
//var randomTextArray: [Int] = []
//var labelVocabularyKorean: String = ""
//// Crash?!
//var firstButton: String = ""
//
//func assingVariables() {
//    dic = randomWords()
//    randomTextArray = chooseRandomText()
//    labelVocabularyKorean = String((dic[randomTextArray[0]]?.fields[0])!)
////   firstButton = String((dic[randomTextArray[1]].fields[1]))
//}

class koreanToEnglishVariables: ObservableObject {
	var dic: [Int : koreanWordsJson]
	var randomTextArray: [Int]
	var labelVocabularyKorean: String
	// Crash?!
	var firstButton: String = ""
	
	init() {
		self.dic = randomWords()
		self.randomTextArray = chooseRandomText()
		self.labelVocabularyKorean = String((dic[randomTextArray[0]]?.fields[0])!)
		self.firstButton = String((dic[randomTextArray[1]]?.fields[1])!)
	}
}
