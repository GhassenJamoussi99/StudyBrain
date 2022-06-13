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
    @Published var questions: [SQuestions] = []
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
        for val in questions {
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
        indexQuestion = self.questions.firstIndex(where: { $0.id == item })!
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
      /*
        for i in 1..10 {
            if self.questions[indexQuestion].correct_answers.answer_a
            if (tenRandomIDQuestionsStates[i])
        }
      */
    }

    func isSubmitClicked() {
        self.isSubmitted = true
    }

    
    func resetGame() {
        self.resetCheckBoxes()
    }
    
    func stringToBool(answer:String) -> Bool {
        if (answer == "true") {
            return true
        } else {
            return false
        }
    }
    
    
    func isUserAnswerForACorrect() -> Bool {
        if (self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_a_correct!) == self.tenRandomIDQuestionsStates[self.indexRandomQuestion].answer_a){
            return true
        } else {
            return false
        }
    }
    
    func isUserAnswerForBCorrect() -> Bool {
        if (self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_b_correct!) == self.tenRandomIDQuestionsStates[self.indexRandomQuestion].answer_b){
            return true
        } else {
            return false
        }
    }
    
    func isUserAnswerForCCorrect() -> Bool {
        if (self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_c_correct!) == self.tenRandomIDQuestionsStates[self.indexRandomQuestion].answer_c){
            return true
        } else {
            return false
        }
    }

    func isUserAnswerForDCorrect() -> Bool {
        if (self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_d_correct!) == self.tenRandomIDQuestionsStates[self.indexRandomQuestion].answer_d){
            return true
        } else {
            return false
        }
    }

    func isUserAnswerForECorrect() -> Bool {
        if (self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_e_correct!) == self.tenRandomIDQuestionsStates[self.indexRandomQuestion].answer_e){
            return true
        } else {
            return false
        }
    }

    func isUserAnswerForFCorrect() -> Bool {
        if (self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_f_correct!) == self.tenRandomIDQuestionsStates[self.indexRandomQuestion].answer_f){
            return true
        } else {
            return false
        }
    }
}

//make this generic for all quizzes
