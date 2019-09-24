//
//  jsonParser.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-28.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

struct koreanWordsJson: Codable {
	let fields: [String]
}

func parseJson() -> Array<koreanWordsJson> {
	// Parser
	do {
		let url = Bundle.main.url(forResource: "Korean_Vocabulary shorter", withExtension: "json")
		let data = try? Data(contentsOf: url!)
		let vocabulary = try JSONDecoder().decode([koreanWordsJson]?.self, from: data!)
		return vocabulary!
	} catch {
		return [koreanWordsJson.init(fields: ["Error in parseJson()"])]
	}
}
