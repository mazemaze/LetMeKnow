//
//  AlarmTimeView.swift
//  LetMeKnow
//
//  Created by 樋川裕次郎 on 2021/11/01.
//

import SwiftUI

struct AlarmTimeView: View {
    @ObservedObject var alarmTime : AlarmTime
    var body: some View {
        Toggle(isOn: $alarmTime.isOn, label : {
            Text(String(format: "%02d:%02d", alarmTime.hour, alarmTime.minute))
                .bold()
                .font(.largeTitle)
        }
        ).padding()
            .frame(height: 80)
        
    }
}

struct AlarmTimeView_Previews: PreviewProvider {
    static var previews: some View {
        let alarmTime = AlarmTime()
        alarmTime.hour = 22
        return AlarmTimeView(alarmTime: alarmTime)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
