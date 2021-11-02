//
//  ContentView.swift
//  LetMeKnow
//
//  Created by 樋川裕次郎 on 2021/11/01.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var settings = UserSetting()
    @State private var isActive = false
    @State private var isOn = false
    var body: some View {
            ZStack {
                Color.mint.edgesIgnoringSafeArea(.all)
                VStack {
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
                    
                    Text("\(settings.content == "" ? "未設定" : "習慣：\(settings.content)")")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.bottom, 100)
                        
//                    Text("継続回数:\(settings.count)")
//                        .foregroundColor(Color.white)
//                        .fontWeight(.bold)
//
//                        .padding(.top)
//                    Button(action: {
//                        print("達成")
//                    }) {
//                        Text("達成")
//                            .foregroundColor(Color.mint)
//                            .frame(width: 160, height: 40)
//                            .background(Color.white)
//                            .cornerRadius(25)
//                            .padding()
//                    }
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
                        
                }
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
