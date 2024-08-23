//
//  ViewController.swift
//  storyboardOutput
//
//  Created by 長谷川拓海 on 2024/01/09.
//  Copyright (c) 2024 *ReNKCHANNEL*. All rights reserved.
//

import UIKit

// 1. エラーの定義
enum ValidationError: Error {
    case invalidEmail
    case weakPassword
    case usernameTooShort
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ユーザー入力の例
        let username = "abc"
        let password = "password"
        
        // 3. エラーをキャッチして処理
        do {
            try processUserInput(username: username, password: password)
        } catch ValidationError.usernameTooShort {
            print("ユーザー名が短すぎます")
        } catch ValidationError.invalidEmail {
            print("無効なメールアドレスです")
        } catch ValidationError.weakPassword {
            print("パスワードが弱すぎます")
        } catch {
            print("その他のエラー: \(error)")
        }
    }
    
    // 2. エラーを投げる関数
    func validateUsername(_ username: String) throws {
        if username.count < 5 {
            throw ValidationError.usernameTooShort
        }
    }
    
    // 4. エラーハンドリングを伝播させる関数
    func processUserInput(username: String, password: String) throws {
        try validateUsername(username)
        // 他の処理（例: パスワードの検証など）
        if password.count < 8 {
            throw ValidationError.weakPassword
        }
    }
}
