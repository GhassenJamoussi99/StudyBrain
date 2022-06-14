//
//  QuizView.swift
//  final_project
//
//  Created by user218705 on 6/12/22.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var QuizVM : QuizViewModel
    @State private var navigateToLinuxQuizz = false
    @State private var navigateToBashQuizz = false
    @State private var navigateToDockerQuizz = false

    var body: some View {
      GeometryReader{ geo in
        VStack {
            VStack{
                 HStack{
                     Text("\(QuizVM.quizCategory) Quiz")
                        .bold()
                        .font(.system(size: 35))
                        .foregroundColor(Color.white)
                 }.padding(.bottom,5)
                
                
                 HStack{
                    Text("Test your \(QuizVM.quizCategory) knowledge by answering these 10 interview questions!")
                       .font(.system(size: 18))
                       .foregroundColor(Color.white)
                       .fixedSize(horizontal: false, vertical: true)
                 }

                HStack(alignment: .center)
                 {
                   Image("\(QuizVM.quizImage)")
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
                    if QuizVM.isSubmitted {
                       QuizVM.tryAgain()
                    } else {
                       QuizVM.isSubmitClicked()
                    }
                }, label: {
                Text(QuizVM.isSubmitted ? "Try again":"Submit")
                    .font(.system(size:15))
                    .bold()
                    .frame(width:geo.size.width/4 - 10, height:geo.size.height/13)
                    .background(QuizVM.isSubmitted ? Color.red: Color.green)
                    .foregroundColor(Color.white)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .opacity(QuizVM.showSubmit ? 1 : 0)
                }).disabled(!QuizVM.showSubmit)
                
             }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
              .padding(.top,2)
        
             HStack {
                    
                    Button(action: {
                       QuizVM.isPreviousClicked()
                    }, label: {
                    Text("Previous")
                        .font(.system(size:15))
                        .frame(width:geo.size.width/4 - 10, height:geo.size.height/13)
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
                        .frame(width:geo.size.width/4 - 10, height:geo.size.height/13)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .opacity( QuizVM.isNextAllowed() ? 1 : 0.5 )
                    }).disabled(!QuizVM.isNextAllowed())
                     
             }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottom)
          }.background(.black)
           .navigationBarTitle("Back")
        }
    }

    @ViewBuilder
    func showQuestionOptions()->some View{
      VStack {
          
            HStack{
                Text(QuizVM.questions[QuizVM.indexQuestion].question)
                    .font(.system(size:15))
                    .bold()
                    .foregroundColor(Color.black)
                    .fixedSize(horizontal: false, vertical: true)
                    
            }.frame(maxWidth: .infinity, alignment: .leading)
             .padding(.bottom,5)
          
            HStack{
                if (QuizVM.questions[QuizVM.indexQuestion].answers.answer_a != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_a ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_a  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_a.toggle()
                            }
                    
                    Text("a.  \(QuizVM.questions[QuizVM.indexQuestion].answers.answer_a!)")
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                    //Show if the submitted answers are correct or not
                    //The checkboxes that are marked will be checked
                    Text(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_a ? (QuizVM.isUserAnswerForACorrect() ?  "✓" : "X" ): "")
                            .font(.system(size:15))
                            .foregroundColor(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_a ? (QuizVM.isUserAnswerForACorrect() ?  Color.green : Color.red): Color.white)
                            .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

            HStack{
                if (QuizVM.questions[QuizVM.indexQuestion].answers.answer_b != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_b ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_b  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_b.toggle()
                            }
                    
                    Text("b.  \(QuizVM.questions[QuizVM.indexQuestion].answers.answer_b!)")
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                    //Show if the submitted answers are correct or not
                    //The checkboxes that are marked will be checked
                    Text(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_b ? (QuizVM.isUserAnswerForBCorrect() ?  "✓" : "X" ): "")
                            .font(.system(size:15))
                            .foregroundColor(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_b ? (QuizVM.isUserAnswerForBCorrect() ?  Color.green : Color.red): Color.white)
                            .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

            HStack{
                if (QuizVM.questions[QuizVM.indexQuestion].answers.answer_c != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_c ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_c  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_c.toggle()
                            }
                    
                    Text("c.  \(QuizVM.questions[QuizVM.indexQuestion].answers.answer_c!)")
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                    //Show if the submitted answers are correct or not
                    //The checkboxes that are marked will be checked
                    Text(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_c ? (QuizVM.isUserAnswerForCCorrect() ?  "✓" : "X" ): "")
                            .font(.system(size:15))
                            .foregroundColor(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_c ? (QuizVM.isUserAnswerForCCorrect() ?  Color.green : Color.red): Color.white)
                            .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

                        
            HStack{
                if (QuizVM.questions[QuizVM.indexQuestion].answers.answer_d != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_d ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_d  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_d.toggle()
                            }
                    
                    Text("d.  \(QuizVM.questions[QuizVM.indexQuestion].answers.answer_d!)")
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                    //Show if the submitted answers are correct or not
                    //The checkboxes that are marked will be checked
                    Text(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_d ? (QuizVM.isUserAnswerForDCorrect() ?  "✓" : "X" ): "")
                            .font(.system(size:15))
                            .foregroundColor(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_d ? (QuizVM.isUserAnswerForDCorrect() ?  Color.green : Color.red): Color.white)
                            .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)


            HStack{
                if (QuizVM.questions[QuizVM.indexQuestion].answers.answer_e != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_e ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_e  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_e.toggle()
                            }
                    
                    Text("e.  \(QuizVM.questions[QuizVM.indexQuestion].answers.answer_e!)")
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                    //Show if the submitted answers are correct or not
                    //The checkboxes that are marked will be checked
                    Text(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_e ? (QuizVM.isUserAnswerForECorrect() ?  "✓" : "X" ): "")
                            .font(.system(size:15))
                            .foregroundColor(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_e ? (QuizVM.isUserAnswerForECorrect() ?  Color.green : Color.red): Color.white)
                            .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

                        
            HStack{
                if (QuizVM.questions[QuizVM.indexQuestion].answers.answer_f != nil ) {
                    Image(systemName: QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_f ? "checkmark.square.fill" : "square")
                        .foregroundColor(QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_f  ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_f.toggle()
                            }
                    
                    Text("f.  \(QuizVM.questions[QuizVM.indexQuestion].answers.answer_f!)")
                            .font(.system(size:15))
                            .foregroundColor(Color.black)
                            .fixedSize(horizontal: false, vertical: true)

                    //Show if the submitted answers are correct or not
                    //The checkboxes that are marked will be checked
                    Text(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_f ? (QuizVM.isUserAnswerForFCorrect() ?  "✓" : "X" ): "")
                            .font(.system(size:15))
                            .foregroundColor(QuizVM.isSubmitted && QuizVM.tenRandomIDQuestionsStates[QuizVM.indexRandomQuestion].answer_f ? (QuizVM.isUserAnswerForFCorrect() ?  Color.green : Color.red): Color.white)
                            .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)

              
            HStack{
                Text("Correct answer(s) is/are :\(QuizVM.correctAnswers)")
                            .font(.system(size:15))
                            .foregroundColor(Color.green)
                            .opacity(QuizVM.isSubmitted ? 1 : 0)
                            .fixedSize(horizontal: false, vertical: true)

            }.frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom,5)
       }.padding(10)
        .disabled(QuizVM.isSubmitted)
    }
}

/*
TODO: See how to make the viewBuilder simpler especially with the if statement (isEmpty)
      simplify these values : QuizVM.questions[QuizVM.indexQuestion].answers.answer_f
          Example : store them in a variable in the view model then call them in this view file

          X ✓
*/
