//
//  SetUpView.swift
//  LetMeKnow
//
//  Created by 樋川裕次郎 on 2021/11/01.
//

import SwiftUI

struct SetUpView: View {
    @Binding var isActive : Bool
    @ObservedObject var settings : UserSetting
    @State private var alarmTime = Date()
    @State private var content : String = ""
    @State private var editting = false
    var body: some View {
        VStack(alignment: .center) {
            VStack{
                Text("毎日通知する時間")
                    .foregroundColor(Color.white)
                    .font(.title)
                    .fontWeight(.medium)
                DatePicker("" ,selection: $alarmTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .clipped()
            }.padding()
            TextField("内容", text: $content, onEditingChanged: { begin in
                if begin {
                    self.editting = true
                }else {
                    self.editting = false
                }
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: editting ? .blue: .clear, radius: 3)
            Spacer()
            
            
            
            Button(action: editValue, label: {
                Text("設定")
                    .foregroundColor(Color.mint)
                    .frame(width: 160, height: 40)
            })
                .background(Color.white)
                .cornerRadius(25)
        }.padding()
        .background(Color.mint)
    }
    func editValue(){
        settings.content = content
        settings.hourAndMinute = alarmTime
        isActive.toggle()
    }
}

