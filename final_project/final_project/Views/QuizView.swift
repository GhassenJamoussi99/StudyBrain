//
//  QuizView.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/12/22.
//

import SwiftUI

struct QuizView: View {
    @StateObject var QuizVM = QuizViewModel()
    @State private var navigateToLinuxQuizz = false
    @State private var navigateToBashQuizz = false
    @State private var navigateToDockerQuizz = false

    var body: some View {
      GeometryReader{ geo in
        VStack {
             HStack{
             Text("TI Quizzes")
                .bold()
                .font(.system(size: 35))
                .foregroundColor(Color.white)
             }.frame(maxWidth: .infinity, alignment: .center)
            
            HStack(alignment: .center)
            {
                Image("TI_Quiz")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom,30)

             //Buttons
             HStack(alignment: .center)
             {
                 NavigationLink(destination: LinuxQuizView().environmentObject(QuizVM), isActive: self.$navigateToLinuxQuizz) { EmptyView() }
                Button(action: {
                    print("test")
                    QuizVM.questions = load("linux_questions.json")
                    QuizVM.setup()
                    self.navigateToLinuxQuizz = true
                    }, label: {
                        Text("Linux Quizz")
                        .font(.system(size:30))
                        .frame(width:geo.size.width - geo.size.width/5, height:geo.size.height/7)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                    })
             }.padding(10)
            
             HStack(alignment: .center)
             {
                NavigationLink(destination: Text("BashView"), isActive: self.$navigateToBashQuizz) { EmptyView() }
                Button(action: {
                    self.navigateToBashQuizz = true
                    }, label: {
                        Text("Bash Quizz")
                        .font(.system(size:30))
                        .frame(width:geo.size.width - geo.size.width/5, height:geo.size.height/7)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                    })
             }.padding(10)
            
             HStack(alignment: .center)
             {
                NavigationLink(destination: Text("DockerView"), isActive: self.$navigateToDockerQuizz) { EmptyView() }
                Button(action: {
                    self.navigateToDockerQuizz = true
                    }, label: {
                        Text("Docker Quizz")
                        .font(.system(size:30))
                        .frame(width:geo.size.width - geo.size.width/5, height:geo.size.height/7)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                    })
             }.padding(10)
                
                
          }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.center)
            .background(.black)
            .navigationBarTitle("Back")
      }
    }
}

/*
                ForEach(questions) { question in
                        Text("\(question.question) is a \(question.id)")
                    }
*/
