//
//  AlarmTime.swift
//  LetMeKnow
//
//  Created by 樋川裕次郎 on 2021/11/01.
//

import Foundation
import UserNotifications
import UIKit

class AlarmTime: ObservableObject, Identifiable {
    var hour = 20
    var minute = 8
    var task = ""
    var isOn = false {
        didSet {
            if isOn {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]){ (granted, _) in
                    if granted {
                        
                    }else{
                        
                    }
                    
                }
                
            }else{
                LocalPushCenter.removeAllPendingNotificationRequests()
            }
        }
    }
}

class LocalPushCenter  {
    static func sendLocalPush(hour: Int, minute: Int, content ntContent: String){
        let timeString = String(format: "%02d:%02d", hour, minute)
        let content = UNMutableNotificationContent()
        content.title = "LetMeKnow"
        content.subtitle = "\(timeString)のアラーム"
        content.body = "やる事：\(ntContent)"
        content.sound = UNNotificationSound.default
        
        let component = DateComponents(hour: hour, minute: minute, second: 0, nanosecond: 0)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: true)
        let request = UNNotificationRequest(identifier: "Achievement", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.delegate = (UIApplication.shared.delegate) as? UNUserNotificationCenterDelegate
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    static func removeAllPendingNotificationRequests(){
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        center.removeAllDeliveredNotifications()
    }
    
    
}
