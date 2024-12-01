//
//  HomeView.swift
//  MorseSignalConverter
//
//  Created by 八久響 on 2024/12/01.
//
import SwiftUI

struct HomeView: View {
    // タブの選択項目を保持する
    @State var selection = 1
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some View {
            TabView(selection: $selection) {
                
                ConvertMorseView()   // Viewファイル①
                    .tabItem {
                        Label("ToMorse", systemImage: "waveform.path")
                    }
                    .tag(1)
                
                ConvertHiraganaView()   // Viewファイル②
                    .tabItem {
                        Label("ToHiragana", systemImage: "key")
                            .foregroundColor(.white)
                    }
                    .tag(2)
            }
        }
    }

#Preview {
    HomeView()
}
