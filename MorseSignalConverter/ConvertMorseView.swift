//
//  ContentView.swift
//  MorseSignalConverter
//
//  Created by 八久響 on 2024/12/01.
//

import SwiftUI

struct ConvertMorseView: View {
    @State var inputText: String = "" // モールス信号に変換する文字列
    @State var outputText: String = "" // モールス信号に変換した文字列

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
                        }
                    }) {
                        Image(systemName: "waveform.path")
                            .resizable()  // アイコンをリサイズ
                            .frame(width: 50, height: 50)  // アイコンのサイズを設定
                            .padding()
                            .background(Color.mint)  // アイコンの背景色
                            .foregroundColor(.white)  // アイコンの色
                            .clipShape(Circle())  // 円形にクリップ            }
                    }
                }
                .padding(.top, 30)
                
                if !outputText.isEmpty {
                    Text("Converted: \(outputText)")
                        .padding(.top, 20)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
