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

final class ViewController: UIViewController {
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var validateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 検証ボタンにアクションを追加
        validateButton.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
    }
    
    // 3. 検証ボタンがタップされたときの処理
    @objc private func didTapValidateButton() {
        resultLabel.text = ""
        
        let username = userNameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        do {
            try processUserInput(username: username, password: password)
            resultLabel.textColor = .green
            resultLabel.text = "検証成功！"
        } catch ValidationError.usernameTooShort {
            resultLabel.text = "ユーザー名が短すぎます"
        } catch ValidationError.weakPassword {
            resultLabel.text = "パスワードが弱すぎます"
        } catch {
            resultLabel.text = "予期しないエラー: \(error)"
        }
    }
    
    // 4. エラーを投げる関数
    func validateUsername(_ username: String) throws {
        if username.count < 5 {
            throw ValidationError.usernameTooShort
        }
    }
    
    // 5. エラーハンドリングを伝播させる関数
    func processUserInput(username: String, password: String) throws {
        try validateUsername(username)
        if password.count < 8 {
            throw ValidationError.weakPassword
        }
    }
}
