//
//  View.swift
//  RGBullsEye
//
//  Created by Max on 19.10.2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct counterModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding(5)
            .background(Color.white)
            .mask(Circle())
    }
    
    
}

extension View {
    func counterView() -> some View {
        self
            .modifier(counterModifier())
    }
}
