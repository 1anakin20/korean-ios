//
//  KoreanToEnglishSwiftUI.swift
//  Korean-iOS
//
//  Created by tomas Daniel Nieto on 2019-10-02.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI
import Combine

struct KoreanToEnglishSwiftUI: View {
	@Published var KoreanToEnglishData = koreanToEnglishVariables
	
	var body: some View {
		VStack(spacing: 30)  {
			Text("Label")
				.offset(y: 250)
			Spacer()
			Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
				Text("First answer")
					.modifier(RoundRectangleButton())
			}
			Button(action:{}) {
				Text("Second answer")
					.modifier(RoundRectangleButton())
			}
			Button(action: {}) {
				Text("Third answer")
					.modifier(RoundRectangleButton())
			}
		}
		.padding(.bottom, 70)
	}
}

struct KoreanToEnglishSwiftUI_Previews: PreviewProvider {
	static var previews: some View {
		KoreanToEnglishSwiftUI()
	}
}
