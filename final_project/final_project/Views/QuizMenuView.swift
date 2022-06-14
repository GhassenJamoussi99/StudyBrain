//
//  QuizView.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/12/22.
//

import SwiftUI

struct QuizMenuView: View {
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
                 NavigationLink(destination: QuizView().environmentObject(QuizVM), isActive: self.$navigateToLinuxQuizz) { EmptyView() }
                Button(action: {
                    QuizVM.quizCategory = "Linux"
                    QuizVM.quizImage = "linux_img"
                    QuizVM.setup(jsonData: "linux_questions.json")
                    self.navigateToLinuxQuizz = true
                    }, label: {
                        Text("Linux Quiz")
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
                NavigationLink(destination: QuizView().environmentObject(QuizVM), isActive: self.$navigateToBashQuizz) { EmptyView() }
                Button(action: {
                    QuizVM.quizCategory = "Bash"
                    QuizVM.quizImage = "bash_img"
                    QuizVM.setup(jsonData: "bash_questions.json")
                    self.navigateToBashQuizz = true
                    }, label: {
                        Text("Bash Quiz")
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
                NavigationLink(destination: QuizView().environmentObject(QuizVM), isActive: self.$navigateToDockerQuizz) { EmptyView() }
                Button(action: {
                    QuizVM.quizCategory = "Docker"
                    QuizVM.quizImage = "docker_img"
                    QuizVM.setup(jsonData: "docker_questions.json")
                    self.navigateToDockerQuizz = true
                    }, label: {
                        Text("Docker Quiz")
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
