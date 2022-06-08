//
//  StudyTimerViewModel.swift
//  final_project
//
//  Created by user218705 on 6/7/22.
//

import Foundation
import SwiftUI


class StudyTimerViewModel: NSObject, ObservableObject{
    // MARK:Timer Properties
    @Published var progress: CGFloat = 1
    @Published var timerStringValue:String = "00:00"
    @Published var isStarted  : Bool = false
    @Published var addNewTimer: Bool = false //invoke add new timer window
    @Published var totalSeconds = 0


    @Published var hour     :Int=0
    @Published var minute   :Int=0
    @Published var seconds  :Int=0
    
    
    func startTimer(){
        totalSeconds-=1
        hour = totalSeconds/3600
        minute = (totalSeconds/60) % 60
        seconds = (totalSeconds % 60)
        timerStringValue = "\(hour == 0 ? "" : "\(hour):")\(minute>=10 ? "\(minute)" : "0\(minute)")\(seconds>=10 ? ":\(seconds)" : ":0\(seconds)")"
        if hour == 0 && seconds == 0 && minute == 0{
            isStarted = false
            print("Finished")
        }
    }
    
    
    func addTimer(){
        timerStringValue = "\(hour == 0 ? "" : "\(hour):")\(minute>=10 ? "\(minute)" : "0\(minute)")\(seconds>=10 ? ":\(seconds)" : ":0\(seconds)")"
        totalSeconds=(hour*3600)+(minute*60)+seconds
    }
    
    
    func isTimerEmpty() -> Bool {
        if (self.timerStringValue == "00:00") {
            return true
        } else {
            return false
        }
    }
}
