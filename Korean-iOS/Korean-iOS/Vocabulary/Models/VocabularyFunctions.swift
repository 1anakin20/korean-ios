//
//  VocabularyFunctions.swift
//  Korean-iOS
//
//  Created by tomas Daniel Nieto on 2019-10-03.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import Foundation

var showRandomWordsDic: [Int : koreanWordsJson] = [:]

func chooseRandomText() -> [Int] {
    var randomArrayInt: [Int] = []
    for _ in randomArrayInt {
        randomArrayInt.append(randomNumber(minInt: 0, maxInt: 2))
    }
    return randomArrayInt
}
