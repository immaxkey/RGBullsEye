//
//  Game.swift
//  RGBullsEye
//
//  Created by Max on 19.10.2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

enum RgbOption {
    case random, initialGuess
}

struct Rgb {
    var red: Double
    var green: Double
    var blue: Double
    
    init(_ option: RgbOption) {
        switch option {
        case .random:
            red = Double.random(in: 0..<1)
            green = Double.random(in: 0..<1)
            blue = Double.random(in: 0..<1)
            
        case .initialGuess:
            self.red = 0.5
            self.green = 0.5
            self.blue = 0.5
        }
    }
}

class Game: ObservableObject {
    @Published var target = Rgb(.random)
    @Published var guess = Rgb(.initialGuess)
    
    private func targetCalculation() {
        target = Rgb(.random)
    }
    
    func startNewRound() {
        targetCalculation()
        guess = Rgb(.initialGuess)
    }
    
    func computeScore() -> Int {
        let rDiff = guess.red - target.red
        let gDiff = guess.green - target.green
        let bDiff = guess.blue - target.blue
        let diff = sqrt((rDiff * rDiff + gDiff * gDiff + bDiff * bDiff) / 3.0)
        return lround((1.0 - diff) * 100.0)
    }
}
