//
//  QuizView.swift
//  final_project
//
//  Created by user218705 on 6/12/22.
//

import SwiftUI

struct LinuxQuizView: View {
    @EnvironmentObject var QuizVM : QuizViewModel
    @State private var navigateToLinuxQuizz = false
    @State private var navigateToBashQuizz = false
    @State private var navigateToDockerQuizz = false

    var body: some View {
      GeometryReader{ geo in
        VStack {
             HStack{
                Text("Linux Quiz")
                    .bold()
                    .font(.system(size: 35))
                    .foregroundColor(Color.white)
             }.frame(maxWidth: .infinity, alignment: .center)

     
             HStack{
                 Text("Test your Linux knowledge by answering these 10 interview questions!")
                    .font(.system(size: 18))
                    .foregroundColor(Color.white)
             }
            
             //Buttons
             HStack(alignment: .center)
             {
                showQuestionOptions()
                
             }.padding(10)
              .frame(maxWidth: .infinity, alignment: .center)
              .background(Color.white)
              .clipShape(Rectangle())
              .cornerRadius(10)
                
          }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.center)
            .background(.black)
            .navigationBarTitle("Back")
        }
    }

    @ViewBuilder
    func showQuestionOptions()->some View{
      VStack {
          
            HStack{
                Text(QuizVM.questions![QuizVM.getQuestionIndexInArray()].question)
                    .font(.system(size:20))
                    .bold()
                    .foregroundColor(Color.black)
            }
            
            HStack{
                if (!QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_a!.isEmpty ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]!.toggle()
                             }
                    
                    Text(QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_a!)
                            .font(.system(size:20))
                            .bold()
                            .foregroundColor(Color.black)
                        }
            /*
              if (questions[idx].answers.answer_b != nil) {

              }

              if (questions[idx].answers.answer_c != nil) {

              }

              if (questions[idx].answers.answer_d != nil) {

              }

              if (questions[idx].answers.answer_e != nil) {

              }

              if (questions[idx].answers.answer_f != nil) {

              }
             */
          }
       }
    }
}

/*
                ForEach(questions) { question in
                        Text("\(question.question) is a \(question.id)")
                    }
*/
