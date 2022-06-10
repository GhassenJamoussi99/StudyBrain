//
//  MemoryGameView.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/7/22.
//
import SwiftUI

struct ConcentrationGameView: View {
   //@StateObject var ConcentrationGameVM  = ConcentrationGameVMGameViewModel()
    @State var isStartVisible:Bool = true
    
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
                
            }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            
            //Show 2 windows
            HStack(alignment: .center, spacing:10) {
                Spacer()
                    Text("test1")
                    .font(.system(size:30))
                    .frame(width:geo.size.width/2 - 20, height:geo.size.height/4)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                
                    Text("test2")
                    .font(.system(size:30))
                    .frame(width:geo.size.width/2 - 20, height:geo.size.height/4)
                    .background(Color.white)
                    .foregroundColor(Color.black)
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
                        isStartVisible = false
                    }, label: {
                    Text("Start")
                        .font(.system(size:30))
                        .frame(width:geo.size.width/3, height:geo.size.height/10)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                    }).frame(height: isStartVisible ? nil : 0)
                      .disabled(!isStartVisible)
                }.frame(maxHeight: .infinity, alignment: .bottom)
                //////////////////////////////////////////////////////////////////////////////
                //True/False buttons
                HStack(alignment: .center){
                    Button(action: {
                    /*if !MemoryGameVM.isStarted {
                        MemoryGameVM.startClicked()
                    } else {
                        MemoryGameVM.checkSubmission()
                    }
                    */
                    }, label: {
                    Text("True")
                        .font(.system(size:30))
                        .frame(width:geo.size.width/3, height:geo.size.height/10)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                    }).frame(height: isStartVisible ? 0 : nil)
                        .disabled(isStartVisible)

                    Button(action: {
                    /*if !MemoryGameVM.isStarted {
                        MemoryGameVM.startClicked()
                    } else {
                        MemoryGameVM.checkSubmission()
                    }
                    */
                    }, label: {
                    Text("False")
                        .font(.system(size:30))
                        .frame(width:geo.size.width/3, height:geo.size.height/10)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                    })
                      .frame(height: isStartVisible ? 0 : nil)
                      .disabled(isStartVisible)

                }
                Spacer()
                }.frame(maxHeight: .infinity, alignment: .bottom)
            
          }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.center)
            .background(.black)
            .navigationBarTitle("Back")
     }
    }
    
    @ViewBuilder
    func newButtons()-> some View{
        HStack{
        }
     }
}
 





















