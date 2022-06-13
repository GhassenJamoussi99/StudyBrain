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
            VStack{
                 HStack{
                    Text("Linux Quiz")
                        .bold()
                        .font(.system(size: 35))
                        .foregroundColor(Color.white)
                 }.padding(.bottom,10)
                
                
                 HStack{
                    Text("Test your Linux knowledge by answering these 10 interview questions!")
                       .font(.system(size: 18))
                       .foregroundColor(Color.white)
                       .fixedSize(horizontal: false, vertical: true)
                 }.padding(.bottom,10)

                 HStack(alignment: .center)
                 {
                   Image("linux_img")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: geo.size.width/2, height: geo.size.height/3)
                 }

             }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
              .padding(20)
        
             //Question Details
             HStack()
             {
                showQuestionOptions()
             }.frame(maxWidth:.infinity, alignment: .center)
              .background(Color.white)
              .clipShape(Rectangle())
              .cornerRadius(10)
              .padding(5)
            
            HStack(alignment: .center){
                Button(action: {
                   //ConcentrationGameVM.isTrueClicked()
                }, label: {
                Text("Next")
                    .font(.system(size:30))
                    .frame(width:geo.size.width/3, height:geo.size.height/10)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                })
                    

                Button(action: {
                   // ConcentrationGameVM.isFalseClicked()
                }, label: {
                Text("Previous")
                    .font(.system(size:30))
                    .frame(width:geo.size.width/3, height:geo.size.height/10)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                })
                //.frame(height: ConcentrationGameVM.isStartVisible ? 0 : nil)
               // .disabled(ConcentrationGameVM.isStartVisible)

            }.frame(maxHeight: .infinity, alignment: .bottom)
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
            }.frame(maxWidth: .infinity, alignment: .leading)
             .padding(.bottom,5)
          
            HStack{
                if (QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_a != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]!.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_a!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)


            HStack{
                if (QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_b != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]!.toggle()
                                }
                    
                    Text(QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_b!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

            HStack{
                if (QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_c != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]!.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_c!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
             .padding(.bottom,5)

                        
            HStack{
                if (QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_d != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]!.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_d!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
             .padding(.bottom,5)


            HStack{
                if (QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_e != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]!.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_e!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
             .padding(.bottom,5)

                        
            HStack{
                if (QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_f != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]! ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion]!.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.getQuestionIndexInArray()].answers.answer_f!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
             .padding(.bottom,5)

       }.padding(10)
    }
}

/*
TODO: See how to make the viewBuilder simpler especially with the if statement (isEmpty)
                ForEach(questions) { question in
                        Text("\(question.question) is a \(question.id)")
                    }
*/
