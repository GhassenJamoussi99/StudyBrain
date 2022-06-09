//
//  MemoryGameViewModel.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/9/22.
//

import Foundation
import SwiftUI

enum states {
    case incorrect
    case notset
    case correct
    case notdecided
}

class MemoryGameViewModel: ObservableObject {
    let rowRange = 5
    let columnRange = 5
    let seconds = 5.0
    var numberOfMistakes = 0

    @Published var spielBrett: [String?] = Array(repeating:nil, count:25)
    @Published var savedSpielBrett: [String?] = Array(repeating:nil, count:25)
    
    @Published var showGuide:Bool = false
    @Published var allowPlay:Bool = false
    @Published var gameOver:Bool = false
    @Published var isStarted:Bool = false
    @Published var isSubmitted:Bool = false
    @Published var trigAlert:Bool = false
    @Published var isFinished:Bool = false

    
    func isSet(row:Int, column:Int) -> Bool {
        return self.spielBrett[columnRange * row + column] == nil ? false : true
    }
    
    func startClicked() {
        self.resetGame()
        self.showGuide = true
        self.randomCases()
        DispatchQueue.main.asyncAfter(deadline: .now() + self.seconds) {
            self.showGuide = false
        }
        self.clearSpielBrett()
        self.isStarted = true
        self.allowPlay = true
    }
    
    func isGameOver() -> Bool {
        if (numberOfMistakes > 0){
            return true
        } else {
            return false
        }
    }

    func checkSubmission() {
        self.isSubmitted = true
        for (index,value) in savedSpielBrett.enumerated() {
            if (self.spielBrett[index] != self.savedSpielBrett[index]) {
                
                //debug infos
                if (value == nil) {
                    print("value of savedSpielBrett = nil")
                } else {
                    print("value of savedSpielBrett = ",value!)
                }
                
                self.spielBrett[index] = "X" //set all false cases to X
                numberOfMistakes+=1
            }
        }
        self.gameOver = self.isGameOver()
        print("Number of Mistakes = ",numberOfMistakes)
        self.trigAlert = true
        self.isFinished = true
    }

    func isCorrect(row:Int, column:Int) -> states {
        if (showGuide) {
            if (self.savedSpielBrett[columnRange * row + column] == "*") {
                return states.correct
            } else {
                return states.notset
            }
        } else if (!self.isSubmitted && !showGuide) {
            if (self.spielBrett[columnRange * row + column] == "*") {
                return states.notdecided
            } else {
                return states.notset
            }
        } else {
            if (self.spielBrett[columnRange * row + column] == "*") {
                return states.correct
            } else if  (self.spielBrett[columnRange * row + column] == "X") {
                return states.incorrect
            } else {
                return states.notset
            }
        }
    }

    func isClicked(row:Int, column:Int) -> Bool {
        if (self.spielBrett[columnRange * row + column] == "*") {
            return true
        } else {
            return false
        }
    }
    
    func caseClicked(row:Int, column:Int) {
        //set all correct cases to *
        self.spielBrett[columnRange * row + column] = "*"
    }
    
    func randomCases() {
        //Random number
        var availableMoves: [Int] = []
        var movesLeft = 0
        var count = 0
        
        while(count < 9 ) {
            movesLeft = 0
            availableMoves = []
            
            for move in spielBrett {
                if move == nil {
                    availableMoves.append(movesLeft)
                }
                movesLeft += 1
            }
            
            if availableMoves.count != 0 {
                self.spielBrett[availableMoves.randomElement()!] = "*"
                count+=1
            }
        }
        self.savedSpielBrett = self.spielBrett
    }
    
    
    func clearSpielBrett() {
        self.spielBrett = Array(repeating:nil, count:25)
    }
    
    func resetGame() {
        self.spielBrett = Array(repeating:nil, count:25)
        self.savedSpielBrett = Array(repeating:nil, count:25)
        self.numberOfMistakes = 0
        self.showGuide = false
        self.allowPlay = false
        self.gameOver = false
        self.isStarted = false
        self.isSubmitted = false
        self.trigAlert = false
        self.isFinished = false
    }
}
