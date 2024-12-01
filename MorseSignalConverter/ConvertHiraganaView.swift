//
//  ContentView.swift
//  MorseSignalConverter
//
//  Created by 八久響 on 2024/12/01.
//

import SwiftUI

struct ConvertHiraganaView: View {
    @State var inputText: String = ""
    @State var outputText: String = ""
    
    var body: some View {
        ZStack {
            Color(UIColor(displayP3Red: 46/255, green: 46/255, blue: 46/255, alpha: 1))
                .edgesIgnoringSafeArea(.all) // 画面全体を覆う
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
                Text("モールス信号よむよむ君")
                    .font(.largeTitle) // フォントを大きくする
                    .fontWeight(.bold) // 太字にする
                    .foregroundColor(.indigo) // 色を変更（任意）
                    .padding() // 上下の余白を追加
                    .multilineTextAlignment(.center) // テキストを中央に配置
                    .lineLimit(nil) // 複数行にする
                    .padding(.top, 20) // タイトルの上に余白を追加
                
                
                TextEditor(text: $inputText)
                    .frame(width:350, height: 300)
                    .scrollContentBackground(.hidden)
                    .background(.gray)
                    .overlay(alignment: .topLeading) {
                        // 未入力の時、プレースホルダーを表示
                        if inputText.isEmpty {
                            Text("ここに文字を入力してください。")
                                .allowsHitTesting(false) // タップ判定を無効化
                                .foregroundColor(Color(uiColor: .placeholderText))
                        }
                    }
                
                VStack {
                    Button(action: {
                        Task {
                            let converted = await convertToHiragana(input: inputText)
                            outputText = converted
                            print("Converted: \(converted)")
                        }
                    }) {
                        Image(systemName: "key")
                            .resizable()  // アイコンをリサイズ
                            .frame(width: 50, height: 50)  // アイコンのサイズを設定
                            .padding()
                            .background(Color.teal)  // アイコンの背景色
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
    ConvertHiraganaView()
}
