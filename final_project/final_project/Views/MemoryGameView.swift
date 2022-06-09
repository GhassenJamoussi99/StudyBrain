//
//  MemoryGameView.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/7/22.
//
import SwiftUI

struct MemoryGameView: View {
   @StateObject var MemoryGameVM  = MemoryGameViewModel()

    var body: some View {
      GeometryReader{ geo in
        VStack {
             HStack{
             Text("Memory Game")
                .bold()
                .font(.system(size: 35))
                .foregroundColor(Color.white)
             }.frame(maxWidth: .infinity)

            VStack(alignment: .leading)
            {
                VStack{
                    Spacer()
                    ForEach(0..<MemoryGameVM.rowRange, id:\.self) { row in
                        HStack(alignment: .center) {
                            ForEach(0..<MemoryGameVM.columnRange, id:\.self) { column in
                            Button(action: {
                                MemoryGameVM.caseClicked(row: row, column: column)
                                }){
                                Text(" ")
                                .font(.system(size: 90))
                                .foregroundColor(Color.white)
                                .frame(width:geo.size.width/CGFloat(MemoryGameVM.columnRange + 1) , height:geo.size.width/CGFloat(MemoryGameVM.rowRange + 1), alignment: .center)
                                .background(
                                    MemoryGameVM.isCorrect(row: row, column: column) == states.correct ? Color.green : (MemoryGameVM.isCorrect(row: row, column: column) == states.incorrect ? Color.red : ( MemoryGameVM.isCorrect(row: row, column: column) == states.notdecided ? Color.orange : Color.cyan ))
                                 )
                                .clipShape(Rectangle())
                                .padding(2)
                                .alert(isPresented: $MemoryGameVM.trigAlert) {
                                    Alert(
                                        title: Text(MemoryGameVM.gameOver ? "Gameover" : "You won"),
                                        message: Text(MemoryGameVM.gameOver ? "You failed to find the right cases." : "You managed to find the right cases."),
                                        primaryButton: .default(
                                            Text("Try Again"),
                                            action: MemoryGameVM.startClicked
                                        ),
                                        secondaryButton: .destructive(
                                            Text("Cancel")
                                        )
                                    )
                                  }
                                }.disabled(MemoryGameVM.isSet(row: row, column: column) || MemoryGameVM.showGuide || !MemoryGameVM.isStarted || MemoryGameVM.isFinished)
                                //If it's set then disable the pushbutton for that case
                                //If showGuide is true set then disable the pushbuttons
                                //If the game did not start then disable the pushbuttons
                                //If the game is finished then disable the pushbuttons
                            }
                        }
                      }
                     Spacer()
                }
                
                HStack(alignment: .center) {
                    Text(MemoryGameVM.showGuide ? "Remember the pattern" : "")
                        .font(.system(size:30))
                        .foregroundColor(Color.white)
                        .fixedSize()
                }.frame(maxWidth: .infinity, alignment: .center)
                
                //Start button
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: {
                        if !MemoryGameVM.isStarted {
                            MemoryGameVM.startClicked()
                        } else if MemoryGameVM.isStarted && MemoryGameVM.isFinished {
                            MemoryGameVM.startClicked()
                        } else {
                            MemoryGameVM.checkSubmission()
                        }
                    }, label: {
                        Text(MemoryGameVM.isStarted ? (MemoryGameVM.isFinished ? "Try Again" : "Submit") : "Start")
                        .font(.system(size:30))
                        .frame(width:geo.size.width/3 + 10, height:geo.size.height/10)
                        .background(MemoryGameVM.isStarted ? (MemoryGameVM.isFinished ? Color.yellow : Color.green) : Color.yellow )
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .opacity(MemoryGameVM.showGuide ? 0.5 : 1)
                    }).disabled(MemoryGameVM.showGuide)
                    //if guide(pattern and text) is shown then disable start button
                    Spacer()
                }
                Spacer()
            }
          }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.center)
            .background(.black)
            .navigationBarTitle("Back")
        }
    }
}





