//
//  Policy.swift
//  LetMeKnow
//
//  Created by 樋川裕次郎 on 2021/11/02.
//

import SwiftUI

struct Policy: View {
    var body: some View {
        ZStack {
            Color.mint.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
              
                    Group{
                        Text("プライベートポリシー")
                            .font(.title)
                            .foregroundColor(Color.white)
                        Divider()
                        Text("アプリの内容：")
                            .font(.title2)
                            .foregroundColor(Color.white)
                        Text("このアプリは、毎日決まった時間に通知を送るアプリです。")
                            .foregroundColor(Color.white)
                        Divider()
                        Text("使用する機能：")
                            .font(.title2)
                            .foregroundColor(Color.white)
                        Text("ローカルの通知機能を使うため、ネットへのアクセスは必要ではありません。")
                            .foregroundColor(Color.white)
                        Divider()
                        Text("データ収集に関して：")
                            .font(.title2)
                            .foregroundColor(Color.white)
                            
                       Text("一切のデータを収集する予定はありません。")
                            
                            .foregroundColor(Color.white)
                    
                    
                    
                }
                Spacer()
                
                
                
           
            }.padding()
            
        }
            
    }
}

struct Policy_Previews: PreviewProvider {
    static var previews: some View {
        Policy()
    }
}
