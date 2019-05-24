//
//  KorEngDict.swift
//  Dictionary 4
//
//  Created by 優しく on 09/04/2018.
//  Copyright © 2018 優しく. All rights reserved.
//

import Foundation

class KorEngDict {
    var id: Int
    var korean: String
    var english: String
    
    init(id: Int, korean: String, english: String){
        self.id = id
        self.korean = korean
        self.english = english
    }
}
