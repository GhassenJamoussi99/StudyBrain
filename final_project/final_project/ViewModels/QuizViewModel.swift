//
//  ConcentrationGameViewModel.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/11/22.
//

import SwiftUI
import Foundation

class QuizViewModel: ObservableObject {
    @Published var tenRandomIDQuestions: [Int] = []
    @Published var tenRandomIDQuestionsStates: [Bool?] = Array(repeating:false, count:10)
    @Published var jsonCategory: String = ""
    @Published var questions: [SQuestions]?
    //@Published var tenRandomQuestions: SQuestions?

    @Published var indexRandomQuestion: Int = 0
    @Published var indexQuestion: Int = 0


    var availableIDs: [Int] = []

    func setup() {
        self.storeAllIDs()
        self.randomizeQuizzes()
    }

    func storeAllIDs() {
        for val in questions! {
            availableIDs.append(val.id)
        }
    }
    
    func randomizeQuizzes() {
         var index = 0

         for _ in 1...10 {
            index = Int(arc4random_uniform(UInt32(self.availableIDs.count)))
            self.tenRandomIDQuestions.append(availableIDs[index])
            self.availableIDs.remove(at:index)
         }

         print(tenRandomIDQuestions)
    }

    func isStartClicked() {

    }

    func randomText() {
    }

    func calculateScore() {
    }

    func questPerQuest() {

    }

    func getQuestionIndexInArray() -> Int {
        let item = self.tenRandomIDQuestions[indexRandomQuestion]
        return self.questions!.firstIndex(where: { $0.id == item })!
    }

    func isNextClicked() {
        if (indexRandomQuestion < 9) {
          indexRandomQuestion += 1
        }
    }

    func isPreviousClicked() {
        if (indexRandomQuestion != 0) {
            indexRandomQuestion -= 1
        }
    }
    
    func resetGame() {
    }
}

//make this generic for all quizzes
