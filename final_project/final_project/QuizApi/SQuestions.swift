//
//  questions.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/12/22.
//

import Foundation

struct SAnswers : Decodable{
    var answer_a: String?
    var answer_b: String?
    var answer_c: String?
    var answer_d: String?
    var answer_e: String?
    var answer_f: String?
}

struct SCorrectAnswers : Decodable{
    var answer_a_correct: String?
    var answer_b_correct: String?
    var answer_c_correct: String?
    var answer_d_correct: String?
    var answer_e_correct: String?
    var answer_f_correct: String?
}


struct SQuestions:Identifiable, Decodable {
        var id: Int
        var question: String
        var answers: SAnswers
        var correct_answers: SCorrectAnswers
        //var multiple_correct_answers: String
        //var correct_answer: String
}
