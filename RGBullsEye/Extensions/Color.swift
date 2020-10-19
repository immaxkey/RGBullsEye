//
//  Color.swift
//  RGBullsEye
//
//  Created by Max on 19.10.2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

extension Color {
    init(rgb: Rgb) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
}
