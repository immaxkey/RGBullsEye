//
//  ColorSlider.swift
//  RGBullsEye
//
//  Created by Max on 22.10.2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
      
    var body: some View {
      HStack {
        Text("0")
          .foregroundColor(textColor)
        Slider(value: $value)
          .background(textColor)
          .cornerRadius(10)
        Text("255")
          .foregroundColor(textColor)
      }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(0.5), textColor: .red)
    }
}
