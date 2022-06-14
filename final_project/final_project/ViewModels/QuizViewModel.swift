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
    @Published var questions: [SQuestions] = []
    @Published var isSubmitted: Bool = false
    @Published var showSubmit: Bool = false
    @Published var indexRandomQuestion: Int = 0
    @Published var indexQuestion: Int = 0
    @Published var correctAnswers: String = ""
    
    //generic text
    @Published var quizCategory: String = ""
    @Published var quizImage: String = ""

    var availableIDs: [Int] = []

    func setup(jsonData: String) {
        self.resetQuiz()
        self.questions = load(jsonData)
        self.storeAllIDs()
        self.randomizeQuizzes()
        self.setNeededQuestionIndex()
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
        print("setNeeded; indexRandomQuestion = ",indexRandomQuestion)
        let item = self.tenRandomIDQuestions[self.indexRandomQuestion]
        self.indexQuestion = self.questions.firstIndex(where: { $0.id == item })!
    }

    func isNextClicked() {
        if (self.indexRandomQuestion < 9) {
            self.indexRandomQuestion += 1
            self.checkSubmitStatus()
            self.setNeededQuestionIndex()
            if (self.isSubmitted){
                self.updateCorrectAnswers()
            }
            print("indexRandomQuestion = ",indexRandomQuestion)
        }
    }

    func isPreviousClicked() {
        if (self.indexRandomQuestion != 0) {
            self.indexRandomQuestion -= 1
            self.checkSubmitStatus()
            self.setNeededQuestionIndex()
            if (self.isSubmitted){
                self.updateCorrectAnswers()
            }
            print("indexRandomQuestion = ",indexRandomQuestion)
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
        if (indexRandomQuestion >= 9) {
          return false
        } else {
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
    
    func updateCorrectAnswers() {
        self.correctAnswers = ""
        self.correctAnswers += self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_a_correct!) ? "a. " : ""
        self.correctAnswers += self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_b_correct!) ? "b. " : ""
        self.correctAnswers += self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_c_correct!) ? "c. " : ""
        self.correctAnswers += self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_d_correct!) ? "d. " : ""
        self.correctAnswers += self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_e_correct!) ? "e. " : ""
        self.correctAnswers += self.stringToBool(answer: self.questions[indexQuestion].correct_answers.answer_f_correct!) ? "f. " : ""
        print("correctAnswers = ",self.correctAnswers)
    }
    
    func resetCheckBoxes() {
        tenRandomIDQuestionsStates = Array(repeating:SAnswersStates(answer_a: false,answer_b: false,answer_c: false,answer_d: false,answer_e: false,answer_f: false), count:10)
    }

    func isSubmitClicked() {
        self.isSubmitted = true
        self.updateCorrectAnswers()
    }

    //prepare new random questions
    func tryAgain() {
        self.tenRandomIDQuestions = []
        self.resetCheckBoxes()
        self.availableIDs = []
        self.isSubmitted = false
        self.showSubmit = false
        self.indexRandomQuestion = 0
        self.indexQuestion = 0
        self.storeAllIDs()
        self.randomizeQuizzes()
    }
    
    func resetQuiz() {
        self.questions = []
        self.tenRandomIDQuestions = []
        self.availableIDs = []
        self.resetCheckBoxes()
        self.isSubmitted = false
        self.showSubmit = false
        self.indexRandomQuestion = 0
        self.indexQuestion = 0
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
