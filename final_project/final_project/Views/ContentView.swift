//
//  ContentView.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToStudyTimer = false
    @State private var navigateToMindGames = false

    //Possibility to create quizzes as well
    //Linux questions and bash etc ...
    @State private var navigateToQuizzes = false
    
    var body: some View {
        GeometryReader{ geo in
            NavigationView {
            VStack
            {
                Spacer()
                //Title
                HStack(alignment: .center)
                {
                    Text("StudyBrain")
                        .bold()
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom,100)
                
                //Image
                /*
                HStack(alignment: .center)
                {
                    Image("study_img")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(50)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom,40)
                */
                
                //Buttons
                HStack(alignment: .center)
                {
                    NavigationLink(destination: QuizView(), isActive: self.$navigateToQuizzes) { EmptyView() }
                    Button(action: {
                        self.navigateToQuizzes = true
                     }, label: {
                          Text("Quizzes")
                         .font(.system(size:30))
                         .frame(width:geo.size.width/2, height:geo.size.height/10)
                         .background(Color.gray)
                         .foregroundColor(Color.white)
                         .clipShape(Rectangle())
                         .cornerRadius(10)
                     })
                }.padding(10)
                
                HStack(alignment: .center)
                {
                    NavigationLink(destination: MindGamesView(), isActive: self.$navigateToMindGames) { EmptyView() }
                    Button(action: {
                        self.navigateToMindGames = true
                     }, label: {
                          Text("Mind Games")
                         .font(.system(size:30))
                         .frame(width:geo.size.width/2, height:geo.size.height/10)
                         .background(Color.gray)
                         .foregroundColor(Color.white)
                         .clipShape(Rectangle())
                         .cornerRadius(10)
                     })
                }.padding(10)
                
                 HStack(alignment: .center)
                 {
                     NavigationLink(destination: StudyTimerView(), isActive: self.$navigateToStudyTimer) { EmptyView() }
                    Button(action: {
                        self.navigateToStudyTimer = true
                     }, label: {
                          Text("Study Timer")
                         .font(.system(size:30))
                         .frame(width:geo.size.width/2, height:geo.size.height/10)
                         .background(Color.gray)
                         .foregroundColor(Color.white)
                         .clipShape(Rectangle())
                         .cornerRadius(10)
                     })
                 }.padding(10)
                
                 Spacer()
               }.background(Image("brain_bg"))
                .navigationBarTitle("Back", displayMode: .inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//TODO : change figure(nil) to opacity(0)
//       Remove unnecessary optional values
