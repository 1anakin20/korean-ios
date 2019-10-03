//
//  propertiesSwiftUI.swift
//  Korean-iOS
//
//  Created by tomas Daniel Nieto on 2019-10-02.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct RoundRectangleButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 3, x: 0, y: 3)
    }
}
