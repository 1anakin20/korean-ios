//
//  jsonParser.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-28.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

struct koreanWordsJson {
	let koreanWord: String
	let englishWord: String
	let sound: String
	let position: String
}

extension koreanWordsJson {
	init(json: [String: String]) throws {
		// Extract fields
		guard let fieldsDictionary = json["fields"] as? [String] else {
			print("Error in fieldsDictionary")
			//return nil
		}
	}
}

class jsonParser: NSObject {
	
	func parseJson() -> Any {
		let koreanJsonURL: String = "Korean_Vocabulary"
		let fileType: String = "json"
		
		var json: Any?
		if let path = Bundle.main.path(forResource: koreanJsonURL, ofType: fileType) {
			do {
				let fileUrl = URL(fileURLWithPath: path)
				// Get data
				var data: Data
				data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
				json = try? JSONSerialization.jsonObject(with: data) as? Data
			} catch {
				// Error
				print("parseJson failed")
			}
		}
		return json!
	}
}
