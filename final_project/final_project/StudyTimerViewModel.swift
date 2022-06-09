//
//  StudyTimerViewModel.swift
//  final_project
//
//  Created by Ghassen Jamoussi on 6/7/22.
//

import Foundation
import SwiftUI


class StudyTimerViewModel: NSObject, ObservableObject, UNUserNotificationCenterDelegate{
    // MARK:Timer Properties
    @Published var timerStringValue:String = "00:00"
    @Published var saveTimerStringValue:String = ""
    @Published var gifName:String = "load0"

    @Published var isStarted  : Bool = false
    @Published var isFinished  : Bool = false
    @Published var addNewTimer: Bool = false //invoke add new timer window
    @Published var isPaused  : Bool = false
    @Published var isCancelButton  : Bool = false
    @Published var isStartButton: Bool = false
    
    @Published var totalSeconds = 0
    @Published var saveTotalSeconds = 0
    @Published var hour     :Int=0
    @Published var minute   :Int=0
    @Published var seconds  :Int=0
    
    // Since Its NSObject
    override init(){
        super.init()
        self.authorizeNotification()
    }

    // MARK:Requesting Notification Access
    func authorizeNotification(){
      UNUserNotificationCenter.current().requestAuthorization(options:[.sound,.alert,.badge]) { _, _ in}
      // MARK:To Show In App Notification
      UNUserNotificationCenter.current().delegate=self
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,willPresent notification:UNNotification,
        withCompletionHandler completionHandler:@escaping(UNNotificationPresentationOptions) -> Void){
        completionHandler([.sound,.banner])
    }
    
    func startTimer(){
        isFinished = false
        totalSeconds-=1
        hour = totalSeconds/3600
        minute = (totalSeconds/60) % 60
        seconds = (totalSeconds % 60)
        timerStringValue = "\(hour == 0 ? "" : "\(hour):")\(minute>=10 ? "\(minute)" : "0\(minute)")\(seconds>=10 ? ":\(seconds)" : ":0\(seconds)")"
        if hour == 0 && seconds == 0 && minute == 0{
            isStarted = false
            isFinished = true
        }
        gifName = gifLoader()
        addNotification()
    }
    
    
    func addTimer(){
        timerStringValue = "\(hour == 0 ? "" : "\(hour):")\(minute>=10 ? "\(minute)" : "0\(minute)")\(seconds>=10 ? ":\(seconds)" : ":0\(seconds)")"
        totalSeconds=(hour*3600)+(minute*60)+seconds
        saveTimerStringValue = timerStringValue
        saveTotalSeconds = totalSeconds
        isFinished = false
        gifName = gifLoader()
    }
    
    //Set old timer back
    func cancelTimer() {
        timerStringValue = saveTimerStringValue
        totalSeconds = saveTotalSeconds
        hour = totalSeconds/3600
        minute = (totalSeconds/60) % 60
        seconds = (totalSeconds % 60)
        isStarted = false
        isFinished = false
        gifName = gifLoader()
    }
    
    func gifLoader() -> String {

        if (!isStarted && !isFinished) {
            return "load0"
        } else if (!isStarted && isFinished){
            return "load4"
        } else {
            return "brain_loader"
        }
    }
    
    func resetTimer() {
        isStarted = false
        isFinished = false
        gifName = gifLoader()
    }

    func isTimerEmpty() -> Bool {
        if (self.timerStringValue == "00:00") {
            return true
        } else {
            return false
        }
    }
    
    func addNotification(){
        let content = UNMutableNotificationContent()
        content.title = "StudyBrain"
        content.subtitle = "Hurra, you finished studying."
        content.sound=UNNotificationSound.default
        let request=UNNotificationRequest(identifier:UUID().uuidString,content:content,trigger:
            UNTimeIntervalNotificationTrigger(timeInterval:TimeInterval(saveTotalSeconds), repeats:false))
        
        UNUserNotificationCenter.current().add(request)
    }
}

//TODO : when clicking on navigationslink timer stops
