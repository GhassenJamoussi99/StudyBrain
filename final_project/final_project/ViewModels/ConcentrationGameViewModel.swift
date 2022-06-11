//
//  ConcentrationGameViewModel.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/11/22.
//

import SwiftUI
import Foundation
import Combine

class ConcentrationGameViewModel: ObservableObject {
    let text_colors:[String] =  ["Blue", "Red", "Yellow", "Green", "Black"]
    let secondsForResult = 0.5
    var textRandomColor:String = ""
    
    @Published var correctCases = 0
    @Published var falseCases = 0
    @Published var gameTimer:Int = 10
    @Published var resultText:String = ""
    

    @Published var firstText:String? = ""
    @Published var secondText:String? = ""
    @Published var randomColor = Color("Black")
    @Published var isStartVisible:Bool = true
    @Published var timer: AnyCancellable?

    @Published var isChecking:Bool = false
    @Published var result:Bool = false
    @Published var callRandom:Bool = false
    @Published var gameOver:Bool = false

    
    func isStartClicked() {
        self.resetGame()
        isStartVisible = false
        self.randomizeValues()
        self.startTimer()
    }
    
    func randomizeValues() {
        self.randomText()
        self.randomTextColor()
    }

    func randomText() {
        self.firstText = text_colors.randomElement()
        self.secondText = text_colors.randomElement()
        print("secondText=",secondText!)
    }

    func randomTextColor() {
        textRandomColor = text_colors.randomElement()!
        print("textRandomColor",textRandomColor)
        self.randomColor = Color(textRandomColor)
    }
    
    func isTrueClicked() {
        isChecking = true
        if (firstText == textRandomColor){
            self.result = true
            correctCases+=1
        } else {
            self.result = false
            falseCases+=1
        }
        self.randomizeValues()
        self.timer = nil
        self.startTimer() //Restart timer
        DispatchQueue.main.asyncAfter(deadline: .now() + self.secondsForResult) {
            self.isChecking = false //dismiss result view
        }
    }

    func isFalseClicked() {
        self.isChecking = true
        if (firstText != textRandomColor){
            self.result = true
            correctCases+=1
        } else {
            self.result = false
            falseCases+=1
        }
        self.randomizeValues()
        self.timer = nil
        self.startTimer() //Restart timer
        DispatchQueue.main.asyncAfter(deadline: .now() + self.secondsForResult) {
            self.isChecking = false //dismiss reuslt view
        }
    }

    func startTimer() {
        //for timer output
        self.timer = Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { _ in
                        print(self.gameTimer)
                        self.gameTimer -= 1
                        if self.gameTimer == 0 {
                            self.timer = nil
                            self.gameOver = true
                            self.calculateScore()
                        }
                    }
    }
    
    func calculateScore() {
        if (self.falseCases == 0) {
            self.resultText = "You seem to be very focused. Congrats\n "
        } else if (self.falseCases > 0 && self.falseCases < 3){
            self.resultText = "Minor mistakes but still, well done\n"
        } else if (self.falseCases >= 4 && self.falseCases < 10){
            self.resultText = "Hmm, are you sober? \n"
        } else {
            self.resultText = "Are you sure you understand the game?\n"
        }
        
        self.resultText += "Score\n\(self.correctCases) correct case(s)\n\(self.falseCases) false case(s)"
    }
    
    func resetGame() {
        textRandomColor = ""
        correctCases = 0
        falseCases = 0
        gameTimer = 0
        resultText = ""
        firstText = ""
        secondText = ""
        randomColor = Color("Black")
        isStartVisible = true
        isChecking = false
        result = false
        callRandom = false
        gameOver = false
    }
}

//note overlay on the view window
//add tick image if true or X image if it's false
//show score with an alert at the end
