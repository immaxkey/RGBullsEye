//
//  RgbText.swift
//  RGBullsEye
//
//  Created by Max on 19.10.2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct RgbText: View {
    let rgb: Rgb?
    
    init(_ rgb: Rgb? = nil) {self.rgb = rgb}
    
    var body: some View {
        self.rgb != nil
            ? Text("R: \(Int(rgb!.red * 255.0))"
                    + " G: \(Int(rgb!.green * 255.0))"
                    + " B: \(Int(rgb!.blue * 255.0))")
            : Text("Match this color")
        
    }
}

struct RgbText_Previews: PreviewProvider {
    static var previews: some View {
        RgbText(Rgb(.random))
    }
}
