//
//  ContentView.swift
//  MorseSignalConverter
//
//  Created by 八久響 on 2024/12/01.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        print("Button was tapped!")
                    }) {
                        Text("SOS")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                }
                .padding(.top, 0)
                .padding(.trailing, 20)
                Spacer()
            }
            
            VStack {
                Text("モールス信号うつうつ君")
                    .font(.largeTitle) // フォントを大きくする
                    .fontWeight(.bold) // 太字にする
                    .foregroundColor(.cyan) // 色を変更（任意）
                    .padding() // 上下の余白を追加
                    .multilineTextAlignment(.center) // テキストを中央に配置
                    .lineLimit(nil) // 複数行にする
                    .padding(.top, 20) // タイトルの上に余白を追加
                
                
                TextEditor(text: $inputText)
                    .frame(width:350, height: 300)
                    .overlay(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.8)
                        // 未入力の時、プレースホルダーを表示
                        if inputText.isEmpty {
                            Text("ここに文字を入力してください。")
                                .allowsHitTesting(false) // タップ判定を無効化
                                .foregroundColor(Color(uiColor: .placeholderText))
                                .padding(6)
                        }
                    }
                
                VStack {
                    Button(action: {
                        print("Button was tapped!")
                    }) {
                        Image(systemName: "waveform.path")
                            .resizable()  // アイコンをリサイズ
                            .frame(width: 40, height: 40)  // アイコンのサイズを設定
                            .padding()
                            .background(Color.mint)  // アイコンの背景色
                            .foregroundColor(.white)  // アイコンの色
                            .clipShape(Circle())  // 円形にクリップ            }
                    }
                }
                .padding(.top, 30)
            }
        }
    }
}

#Preview {
    ContentView()
}
