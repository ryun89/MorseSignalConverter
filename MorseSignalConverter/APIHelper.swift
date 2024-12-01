//
//  APIRequest.swift
//  MorseSignalConverter
//
//  Created by 八久響 on 2024/12/01.
//

import Foundation

// ひらがな化APIを叩きモールス信号に変換する非同期関数
func convertToHiragana(input: String) async -> String {
    let url = URL(string: "https://labs.goo.ne.jp/api/hiragana")!
    let API_KEY = "d9ea01cda118fe8ed0c90ce6c43ac7ee666ee0b3a07a7cf0770943382475970f"
    
    // リクエストのパラメータ
    let parameters: [String: Any] = [
        "app_id": API_KEY,
        "sentence": input,
        "output_type": "hiragana"
    ]
    
    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
        return ""  // リクエストのパラメータのエンコードに失敗した場合
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = httpBody
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        // URLSessionを使って非同期通信を行う
        let (data, _) = try await URLSession.shared.data(for: request)
        
        // レスポンスをJSON形式に変換
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            if let converted = json["converted"] as? String {
                return convertHiraganaToMorseCode(converted)  // 変換されたひらがなを返す
            } else {
                return ""  // "converted"がない場合、空文字を返す
            }
        }
        return ""  // JSON変換に失敗した場合、空文字を返す
    } catch {
        // エラーが発生した場合
        print("Error: \(error.localizedDescription)")
        return ""  // エラーが発生した場合、空文字を返す
    }
}
