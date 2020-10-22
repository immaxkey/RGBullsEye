//
//  Game.swift
//  RGBullsEye
//
//  Created by Max on 19.10.2020.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

enum SliderColor {
    case red, green, blue
}


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
    
    func bkOpacity(for sliderColor: SliderColor) -> Double {
        switch sliderColor {
        case .blue:
            return opacityCulc(value1: guess.blue, value2: target.blue)
        case .green:
            return opacityCulc(value1: guess.green, value2: target.green)
        case .red:
            return opacityCulc(value1: guess.red, value2: target.red)
        
        }
    }
    
    private func opacityCulc(value1: Double, value2: Double) -> Double {
        0.3 + abs(value1 - value2) / 0.7
    }
    
    
}
