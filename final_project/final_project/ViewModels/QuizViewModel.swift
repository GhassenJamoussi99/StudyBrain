//
//  ConcentrationGameViewModel.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/11/22.
//

import SwiftUI
import Foundation

struct SAnswersStates{
    var answer_a: Bool
    var answer_b: Bool
    var answer_c: Bool
    var answer_d: Bool
    var answer_e: Bool
    var answer_f: Bool
}

class QuizViewModel: ObservableObject {
    @Published var tenRandomIDQuestions: [Int] = []
    @Published var tenRandomIDQuestionsStates: [SAnswersStates] = Array(repeating:SAnswersStates(answer_a: false,answer_b: false,answer_c: false,answer_d: false,answer_e: false,answer_f: false), count:10)
    //@Published var all_answers_states: [Bool?] = Array(repeating:false, count:6)
    @Published var jsonCategory: String = ""
    @Published var questions: [SQuestions]?
    @Published var isSubmitted: Bool = false
    @Published var showSubmit: Bool = false

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

    func setNeededQuestionIndex() {
        let item = self.tenRandomIDQuestions[indexRandomQuestion]
        indexQuestion = self.questions!.firstIndex(where: { $0.id == item })!
    }

    func isNextClicked() {
        if (indexRandomQuestion < 9) {
          indexRandomQuestion += 1
          self.checkSubmitStatus()
          print("indexRandomQuestion = ",indexRandomQuestion)
          self.setNeededQuestionIndex()
        }
    }

    func isPreviousClicked() {
        if (indexRandomQuestion != 0) {
            indexRandomQuestion -= 1
            self.checkSubmitStatus()
            self.setNeededQuestionIndex()
        }
    }
    
    func checkSubmitStatus() {
        if (indexRandomQuestion >= 9) {
          self.showSubmit = true
        } else {
          self.showSubmit = false
        }
    }
    
    func isNextAllowed() -> Bool {
        print("isNextAllowed ?")
        if (indexRandomQuestion >= 9) {
          return false
        } else {
          print("Next is allowed")
          return true
        }
    }
    
    func isPreviousAllowed() -> Bool {
        if (indexRandomQuestion <= 0) {
          return false
        } else {
          return true
        }
    }
    
    func resetCheckBoxes() {
        tenRandomIDQuestionsStates = Array(repeating:SAnswersStates(answer_a: false,answer_b: false,answer_c: false,answer_d: false,answer_e: false,answer_f: false), count:10)
    }
    
    func calculateScore() {
    }

    
    func resetGame() {
        self.resetCheckBoxes()
    }
    
}

//make this generic for all quizzes
