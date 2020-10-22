/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main , in: .common).autoconnect()
    @ObservedObject var game = Game()
    
    @State private var counter = 0
    @State private var stopCount = false
    @State var showAlert = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Color(rgb: game.target)
                        self.showAlert ? RgbText(game.target) : RgbText()
                    }
                    
                    VStack {
                        Color(rgb: game.guess)
                            .overlay(
                                Text("\(counter)")
                                    .counterView()
                            )
                            .onReceive(timer, perform: { _ in
                                guard !stopCount else { return }
                                counter += 1
                            })
                        
                        RgbText(game.guess)
                    }
                }
                
                Button(action: {
                    self.showAlert = true
                    self.stopCount = true
                }) {
                    Text("Hit Me!")
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Your Score"), message: Text(String(game.computeScore())), dismissButton: .default(Text("OK"), action: {
                        game.startNewRound()
                        counter = 0
                        stopCount = false
                    }))
                }
                .padding()
                
                VStack {
                    ColorSlider(value: $game.guess.red, textColor: .red)
                    ColorSlider(value: $game.guess.green, textColor: .green)
                    ColorSlider(value: $game.guess.blue, textColor: .blue)
                }
                .padding(.horizontal)
            }
        }
        //prevent split view in landscape on iPhone 11 Pro Maz
        .navigationViewStyle(StackNavigationViewStyle())
        //    .colorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
        ContentView()
    }
        
//      .previewLayout(.fixed(width: 568, height: 320))
//        .environment(\.colorScheme, .dark)
  }
}


