//
//  UserSetting.swift
//  LetMeKnow
//
//  Created by 樋川裕次郎 on 2021/11/01.
//

import Foundation
import UserNotifications

class UserSetting: ObservableObject {
    let alarmTime = AlarmTime()
    @Published var content : String {
        didSet {
            UserDefaults.standard.set(content, forKey: "content")
        }
    }
    
    @Published var hourAndMinute  : Date {
        didSet {
            UserDefaults.standard.set(hourAndMinute, forKey: "hourAndMinute")
            let dateComponet = Calendar.current.dateComponents([.hour, .minute], from: hourAndMinute)
            alarmTime.hour = dateComponet.hour ?? 0
            alarmTime.minute = dateComponet.minute ?? 0
        }
    }
    
    @Published var isOn : Bool {
        didSet {
            UserDefaults.standard.set(isOn, forKey: "isOn")
            alarmTime.isOn = isOn
            if isOn {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]){ (granted, _) in
                    if granted {
                        LocalPushCenter.sendLocalPush(hour: self.alarmTime.hour, minute: self.alarmTime.minute, content: self.content)
                    }else{
                
                        LocalPushCenter.removeAllPendingNotificationRequests()
                    }
                    
                }
            }
        }
    }
    
    @Published var count : Int {
        didSet {
            UserDefaults.standard.set(count, forKey: "count")
        }
    }
    
    init(){
        content = UserDefaults.standard.string(forKey: "content") ?? ""
        hourAndMinute = UserDefaults.standard.object(forKey: "hourAndMinute") as? Date ?? Date()
        
        
        count = UserDefaults.standard.object(forKey: "count") as? Int ?? 0
        isOn = UserDefaults.standard.bool(forKey: "isOn")
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: hourAndMinute)
        alarmTime.hour = dateComponents.hour ?? 0
        alarmTime.minute = dateComponents.minute ?? 0
    }
}
