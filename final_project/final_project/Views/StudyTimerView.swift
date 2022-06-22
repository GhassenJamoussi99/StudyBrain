//
//  StudyTimerView.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/7/22.
//
import SwiftUI

struct StudyTimerView: View {
    @StateObject var StudyTimerVM  = StudyTimerViewModel()
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                VStack {
                    VStack {
                        HStack{
                        Text("Study Timer")
                            .bold()
                            .font(.system(size: 35))
                            .foregroundColor(Color.white)
                        }
                    
                        //GifImage lib is a static view so we need multiple objects instantiation to update the GIF
                        HStack{
                            if (StudyTimerVM.gifName == "load0" ) { //not started yet
                              GifImage(StudyTimerVM.gifName)
                            } else if (StudyTimerVM.gifName == "load2" ) { //is paused
                              GifImage(StudyTimerVM.gifName)
                            } else if (StudyTimerVM.gifName == "load4" ) { //is finished
                              GifImage(StudyTimerVM.gifName)
                            } else if (StudyTimerVM.gifName == "brain_loader") { //timer is working
                              GifImage(StudyTimerVM.gifName)
                            }
                        }.frame(width: geo.size.width/2,height:geo.size.height/2)
                                        
                        HStack{
                            Text(StudyTimerVM.timerStringValue)
                                .font(.system(size:45,weight:.light))
                                .foregroundColor(.white)
                        }.frame(width: geo.size.width, height: geo.size.height/4)
                        
                    }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
                    
                    HStack {
                        Button(action: {
                            if StudyTimerVM.isStarted && !StudyTimerVM.isPaused {
                                StudyTimerVM.pauseTimer()
                            } else if StudyTimerVM.isPaused {
                                StudyTimerVM.resumeTimer()
                            } else {
                                StudyTimerVM.addNewTimer = true //invoke add new timer window
                            }
                         },
                             label: {
                            Text(StudyTimerVM.isPaused ? (StudyTimerVM.isStarted ? "Resume" : "Add Timer") : (StudyTimerVM.isStarted ? "Pause" : "Add Timer"))
                             .font(.system(size:20))
                             .frame(width:geo.size.width/3, height:geo.size.height/10)
                             .background(StudyTimerVM.isPaused ? Color.cyan : (StudyTimerVM.isStarted ? Color.red : Color.cyan))
                             .foregroundColor(Color.white)
                             .clipShape(Rectangle())
                             .cornerRadius(20)
                            
                         })
                        
                        Button(action: {
                            if (!StudyTimerVM.isStarted) {
                                StudyTimerVM.isStarted = true
                            } else {
                                StudyTimerVM.cancelTimer()
                            }
                        },
                             label: {
                            Text(StudyTimerVM.isStarted ? "Cancel" : "Start")
                             .font(.system(size:20))
                             .frame(width:geo.size.width/3, height:geo.size.height/10)
                             .background(StudyTimerVM.isStarted ? Color.gray : Color.cyan)
                             .foregroundColor(Color.white)
                             .clipShape(Rectangle())
                             .cornerRadius(20)
                            
                        }).disabled(StudyTimerVM.isTimerEmpty())
                          .opacity(StudyTimerVM.isTimerEmpty() ? 0.5 : 1)
                    }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottom)
                }
            }
        }.padding()
         .overlay(content:{
                ZStack{
                    Color.black
                        .opacity(StudyTimerVM.addNewTimer ? 0.25 : 0)
                        .onTapGesture {
                            //dismiss add new timer window
                            StudyTimerVM.addNewTimer = false
                        }
                    
                    NewTimerView()
                        .frame(maxHeight:.infinity,alignment:.bottom)
                        .offset(y:StudyTimerVM.addNewTimer ? 0 : 400)
               }
                .animation(.easeInOut,value:StudyTimerVM.addNewTimer)
          })
        // .background(Color("BG_2"))
         .background(Color("Black"))
         .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
             if StudyTimerVM.isStarted && !StudyTimerVM.isPaused{
                 StudyTimerVM.startTimer()
             }
             
         }
         .alert(isPresented: $StudyTimerVM.isFinished) {
            Alert(
                title: Text("Timer ended"),
                message: Text("Hurra, you finished studying.\nTake a break and come back later."),
                dismissButton: .default(
                    Text("OK"),
                    action: {
                        StudyTimerVM.resetTimer()
                    }
                )
            )
         }
    }
    //New Timer Bottom Sheet
    @ViewBuilder
     func NewTimerView()->some View{
        VStack(spacing:15){
         HStack{
                Text("Add New Timer")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .padding(.top,10)
            }
    
            
         HStack(spacing:15) {
             Text("\(StudyTimerVM.hour) hr")
                 .font(.title3)
                 .fontWeight(.semibold)
                 .foregroundColor(.white.opacity(0.3))
                 .padding(.horizontal,20)
                 .padding(.vertical,12)
                 .background{
                    Capsule()
                         .fill(.white.opacity(0.2))
                 }
                  .contextMenu{
                  ContextMenuOptions(maxValue:23,hint:"hr"){ value in
                        StudyTimerVM.hour = value }
                 }
                       
             Text("\(StudyTimerVM.minute) mn")
                 .font(.title3)
                 .fontWeight(.semibold)
                 .foregroundColor(.white.opacity(0.3))
                 .padding(.horizontal,20)
                 .padding(.vertical,12)
                 .background{
                    Capsule()
                         .fill(.white.opacity(0.2))
                 }
                 .contextMenu{
                    ContextMenuOptions(maxValue:59,hint:"mn"){ value in
                        StudyTimerVM.minute = value }
                 }
             
             Text("\(StudyTimerVM.seconds) sec")
                 .font(.title3)
                 .fontWeight(.semibold)
                 .foregroundColor(.white.opacity(0.3))
                 .padding(.horizontal,20)
                 .padding(.vertical,12)
                 .background{
                    Capsule()
                         .fill(.white.opacity(0.2))
                 }
                 .contextMenu{
                        ContextMenuOptions(maxValue:59,hint:"sec"){ value in
                            StudyTimerVM.seconds = value }
                 }

         }.padding(.top)
            
            Button{
                StudyTimerVM.addNewTimer = false
                StudyTimerVM.addTimer()
            }label:{
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal,100)
                    .background{
                        Capsule()
                    }
            }
            //add opacity for save button later
            .padding(.top)
            
         }
        .padding()
        .frame(maxWidth:.infinity)
        .background{
            RoundedRectangle(cornerRadius:10, style:.continuous)
                //.fill(Color("BG_2"))
                .fill(Color("darkblue"))
                .ignoresSafeArea()
        }
    }
    
    // Reusable Context Menu Options
    @ViewBuilder
    func ContextMenuOptions(maxValue:Int, hint:String, onClick: @escaping(Int)->())->some View{
        ForEach(0...maxValue,id:\.self){value in Button("\(value) \(hint)"){
                onClick(value)
            }
        }
    }
}





