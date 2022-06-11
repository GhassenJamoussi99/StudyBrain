//
//  MemoryGameView.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/7/22.
//
import SwiftUI

struct ConcentrationGameView: View {
    @StateObject var ConcentrationGameVM  = ConcentrationGameViewModel()
    
    var body: some View {
      GeometryReader{ geo in
        VStack {
            
            VStack{
                HStack{
                 Text("Concentration Game")
                    .bold()
                    .font(.system(size: 35))
                    .foregroundColor(Color.white)
                }.padding(20)

                HStack{
                 Text("Does the significance match the color of the text?")
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                 }
                
                HStack{
                    Text("Time left : \(ConcentrationGameVM.gameTimer)")
                    .font(.system(size: 20))
                    .foregroundColor(Color.red)
                 }
                
            }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            
            //Show 2 windows
            HStack(alignment: .center, spacing:10) {
                Spacer()
                Text(ConcentrationGameVM.firstText!)
                    .font(.system(size:30))
                    .bold()
                    .frame(width:geo.size.width/2 - 20, height:geo.size.height/4)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                
                Text(ConcentrationGameVM.secondText!)
                    .font(.system(size:30))
                    .bold()
                    .frame(width:geo.size.width/2 - 20, height:geo.size.height/4)
                    .background(Color.white)
                    .foregroundColor(ConcentrationGameVM.randomColor)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .padding(.leading,1)
                Spacer()
            }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .center)

            //Show 2 subwindows for explanation
            HStack(alignment: .center, spacing:10) {
                Spacer()
                    Text("Significance")
                    .font(.system(size:20))
                    .frame(width:geo.size.width/3 , height:geo.size.height/8)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                Spacer()
                    Text("Color of the text")
                    .font(.system(size:20))
                    .frame(width:geo.size.width/3 , height:geo.size.height/8)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                Spacer()
            }

            VStack(alignment: .center) {
                //Start button
                Spacer()
                HStack{
                    Button(action: {
                        ConcentrationGameVM.isStartClicked()
                    }, label: {
                    Text("Start")
                        .font(.system(size:30))
                        .frame(width:geo.size.width/3, height:geo.size.height/10)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                    }).frame(height: ConcentrationGameVM.isStartVisible ? nil : 0)
                        .disabled(!ConcentrationGameVM.isStartVisible)
                }.frame(maxHeight: .infinity, alignment: .bottom)
                //////////////////////////////////////////////////////////////////////////////
                //True/False buttons
                HStack(alignment: .center){
                    Button(action: {
                       ConcentrationGameVM.isTrueClicked()
                    }, label: {
                    Text("True")
                        .font(.system(size:30))
                        .frame(width:geo.size.width/3, height:geo.size.height/10)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                    }).frame(height: ConcentrationGameVM.isStartVisible ? 0 : nil)
                        .disabled(ConcentrationGameVM.isStartVisible)

                    Button(action: {
                        ConcentrationGameVM.isFalseClicked()
                    }, label: {
                    Text("False")
                        .font(.system(size:30))
                        .frame(width:geo.size.width/3, height:geo.size.height/10)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                    })
                    .frame(height: ConcentrationGameVM.isStartVisible ? 0 : nil)
                    .disabled(ConcentrationGameVM.isStartVisible)

                }
                Spacer()
                }.frame(maxHeight: .infinity, alignment: .bottom)
            
          }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.center)
            .background(.black)
            .navigationBarTitle("Back")
            .overlay(content:{
                    ZStack{
                    Color.black
                        .opacity(ConcentrationGameVM.isChecking ? 0.25 : 0)
                        .onTapGesture {
                            //dismiss result view
                            ConcentrationGameVM.isChecking = false
                        }
                    
                        Image( ConcentrationGameVM.result ? "tick_mark": "x_mark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight:.infinity,alignment:.center)
                            .frame(height: ConcentrationGameVM.isChecking ? nil : 0)
                }
                .animation(.easeInOut,value:ConcentrationGameVM.isChecking)
             })
        }.alert(isPresented: $ConcentrationGameVM.gameOver) {
            Alert(
                title: Text("Final score"),
                message: Text(ConcentrationGameVM.resultText),
                primaryButton: .default(
                    Text("Try Again"),
                    action: ConcentrationGameVM.isStartClicked
                ),
                secondaryButton: .destructive(
                    Text("Cancel"),
                    action: ConcentrationGameVM.resetGame
                )
            )
         }
    }
    
    @ViewBuilder
    func newButtons()-> some View{
        HStack{
        }
     }
}
 





















