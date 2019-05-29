//
//  jsonParser.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-28.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class jsonParser: NSObject {
	struct koreanWordsJson {
		let koreanWord: String
		let englishWord: String
		let sound: String
		let position: String
	}
	
	func parseJson() -> Any {
		let koreanJsonURL: String = "Korean_Vocabulary"
		let fileType: String = "json"
		
		var json: Any?
		if let path = Bundle.main.path(forResource: koreanJsonURL, ofType: fileType) {
			do {
				let fileUrl = URL(fileURLWithPath: path)
				// Get data
				let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
				json = try? JSONSerialization.jsonObject(with: data)
			} catch {
				// Error
				print("parseJson failed")
			}
		}
		return json!
	}
	
	func getKorean() {
		let parsedJson = parseJson()
		if let koreanWord = parsedJson["fields"] as String {
			
		}
	}
}
