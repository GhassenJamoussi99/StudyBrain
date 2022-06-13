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
                 }

                HStack(alignment: .center)
                 {
                   Image("linux_img")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: geo.size.width/2 - 50, height: geo.size.height/4)
                 }
                
                //Question Details
                HStack()
                {
                   showQuestionOptions()
                }.frame(maxWidth:.infinity, alignment: .center)
                 .background(Color.white)
                 .clipShape(Rectangle())
                 .cornerRadius(10)
                 .padding(.bottom,5)
                
                Button(action: {
                   //todo
                }, label: {
                Text("Submit")
                    .font(.system(size:15))
                    .frame(width:geo.size.width/4 - 10, height:geo.size.height/11)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .opacity(QuizVM.showSubmit ? 1 : 0)
                })//.frame(height: QuizVM.showSubmit ? nil : 0) //nil in this case means do nothing; keep the frame as it is
                  .disabled(!QuizVM.showSubmit)

             }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
              .padding(.top,2)
        
             HStack {
                    
                    Button(action: {
                       QuizVM.isPreviousClicked()
                    }, label: {
                    Text("Previous")
                        .font(.system(size:15))
                        .frame(width:geo.size.width/4 - 10, height:geo.size.height/11)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .opacity( QuizVM.isPreviousAllowed() ? 1 : 0.5 )
                    }).disabled(!QuizVM.isPreviousAllowed())
                 
                    Button(action: {
                       QuizVM.isNextClicked()
                    }, label: {
                    Text("Next")
                        .font(.system(size:15))
                        .frame(width:geo.size.width/4 - 10, height:geo.size.height/11)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .opacity( QuizVM.isNextAllowed() ? 1 : 0.5 )
                    }).disabled(!QuizVM.isNextAllowed())
                     
             }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottom)
          }//.frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.center)
           .background(.black)
           .navigationBarTitle("Back")
        }
    }

    @ViewBuilder
    func showQuestionOptions()->some View{
      VStack {
          
            HStack{
                Text(QuizVM.questions![QuizVM.indexQuestion].question)
                    .font(.system(size:15))
                    .bold()
                    .foregroundColor(Color.black)
                    .fixedSize(horizontal: false, vertical: true)
                    
            }.frame(maxWidth: .infinity, alignment: .leading)
             .padding(.bottom,5)
          
            HStack{
                if (QuizVM.questions![QuizVM.indexQuestion].answers.answer_a != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_a ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_a  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_a.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.indexQuestion].answers.answer_a!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

            HStack{
                if (QuizVM.questions![QuizVM.indexQuestion].answers.answer_b != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_b ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_b  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_b.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.indexQuestion].answers.answer_b!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

            HStack{
                if (QuizVM.questions![QuizVM.indexQuestion].answers.answer_c != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_c ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_c  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_c.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.indexQuestion].answers.answer_c!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

                        
            HStack{
                if (QuizVM.questions![QuizVM.indexQuestion].answers.answer_d != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_d ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_d  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_d.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.indexQuestion].answers.answer_d!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)


            HStack{
                if (QuizVM.questions![QuizVM.indexQuestion].answers.answer_e != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_e ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_e  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_e.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.indexQuestion].answers.answer_e!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

                        
            HStack{
                if (QuizVM.questions![QuizVM.indexQuestion].answers.answer_f != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_f ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_f  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_f.toggle()
                            }
                    
                    Text(QuizVM.questions![QuizVM.indexQuestion].answers.answer_f!)
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

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
