//
//  LetMeKnowApp.swift
//  LetMeKnow
//
//  Created by 樋川裕次郎 on 2021/11/01.
//

import SwiftUI
import Firebase



@main
struct LetMeKnowApp: App {
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) var appDelegate
    init(){
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserSetting())
        }
    }
}

class MyAppDelegate:  UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    @ObservedObject var settings = UserSetting()
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Something")
           UNUserNotificationCenter.current().delegate = self
           return true
       }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Somethin")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("アプリを開きそうな時に呼ばれる")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("アプリを開いた時に呼ばれる")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("フリックしてアプリを終了させた時に呼ばれる")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Somehow")
        UserSetting.shared.isNotificationTapped = true
        completionHandler()
    }
}

