//
//  ContentView.swift
//  LetMeKnow
//
//  Created by 樋川裕次郎 on 2021/11/01.
//

import SwiftUI
import GoogleMobileAds
import UIKit

struct ContentView: View {
    @ObservedObject var settings : UserSetting = UserSetting.shared
    @State private var isActive = false
    @State private var isOn = false
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Color.mint.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("現在の設定時刻")
                    .foregroundColor(Color.white)
                    .font(.title)
                    .fontWeight(.bold)
                Text(String(format: "%02d:%02d", settings.alarmTime.hour, settings.alarmTime.minute))
                    .bold()
                    .font(.largeTitle)
                    .frame(maxWidth: 200, maxHeight: 60 )
                    .foregroundColor(Color.mint)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.bottom)
                
                
                Text("\(settings.content == "" ? "習慣：未設定" : "習慣：\(settings.content)")")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                
                
                Text("継続回数：\(settings.count)")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                if settings.isNotificationTapped{
                    Button(action: {
                        settings.count = settings.count + 1
                        settings.isNotificationTapped = false
                    }) {
                        Text("達成")
                            .foregroundColor(Color.mint)
                            .frame(width: 160, height: 40)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding()
                    }
                }else{
                    Spacer()
                        .frame(height: 40)
                }
                
                
                Text("アラームをセットする")
                    .foregroundColor(Color.white)
                    .fontWeight(.medium)
                Toggle(isOn: $settings.isOn) {
                }.labelsHidden()
                Button(action: {
                    self.isActive.toggle()
                }) {
                    Text("設定する")
                        .foregroundColor(Color.mint)
                        .frame(width: 160, height: 40)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding()
                }
                Spacer()
                
            }
            AdmobBannerView()
                .frame(width: 320, height: 50)
        }.sheet(isPresented: $isActive){
            SetUpView(isActive: $isActive, settings: settings)
        }
        .background(Color.mint)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AdmobBannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let view = GADBannerView(adSize: kGADAdSizeBanner)
        #if DEBUG
        view.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        #else
        view.adUnitID = "ca-app-pub-4427370626079641/6625303934"
        #endif
        view.rootViewController = UIApplication.shared.windows.first?.rootViewController
        view.load(GADRequest())
        return view
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}
