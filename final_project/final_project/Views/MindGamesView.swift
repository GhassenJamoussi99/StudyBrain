//
//  MindGamesView.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/7/22.
//
import SwiftUI

struct MindGamesView: View {
    @State private var navigateToMemoryGame = false
    @State private var navigateToConcentrationGame = false

    var body: some View {
      GeometryReader{ geo in
        VStack {
             HStack{
             Text("Mind Games")
                .bold()
                .font(.system(size: 35))
                .foregroundColor(Color.white)
             }.frame(maxWidth: .infinity)
            
            HStack(alignment: .center)
            {
                Image("facebrain")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom,30)

             //Buttons
             HStack(alignment: .center)
             {
                NavigationLink(destination: Text("Memory Game"), isActive: self.$navigateToMemoryGame) { EmptyView() }
                Button(action: {
                    self.navigateToMemoryGame = true
                    }, label: {
                        Text("Memory Game")
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
                NavigationLink(destination: Text("Concentration Game"), isActive: self.$navigateToConcentrationGame) { EmptyView() }
                Button(action: {
                    self.navigateToConcentrationGame = true
                    }, label: {
                        Text("Concentration Game")
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





