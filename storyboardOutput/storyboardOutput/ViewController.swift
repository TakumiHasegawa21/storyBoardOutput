//
//  ViewController.swift
//  storyboardOutput
//
//  Created by 長谷川拓海 on 2024/01/09.
//  Copyright (c) 2024 *ReNKCHANNEL*. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 基本的なオプショナルの使用
        var optionalString: String? = "Hello, Swift!"
        print("Basic Optional: \(optionalString)")
        
        // 強制アンラップ
        if let unwrappedString = optionalString {
            print("Force Unwrapped: \(unwrappedString)") // Hello, Swift!
        } else {
            print("Value is nil")
        }
        
        // 安全なアンラップ (if let)
        if let unwrappedString = optionalString {
            print("Safely Unwrapped (if let): \(unwrappedString)") // Hello, Swift!
        } else {
            print("Value is nil")
        }
        
        // 安全なアンラップ (guard let)
        func printMessage(optionalString: String?) {
            guard let unwrappedString = optionalString else {
                print("Guard Let - Value is nil")
                return
            }
            print("Guard Let - Unwrapped Value: \(unwrappedString)") // Hello, Swift!
        }
        printMessage(optionalString: optionalString)
        
        // nil-coalescing演算子
        let defaultString = optionalString ?? "Default Value"
        print("Nil-coalescing Operator: \(defaultString)") // Hello, Swift!
        
        // 暗黙的アンラップオプショナル
        var implicitOptional: String! = "John Doe"
        print("Implicitly Unwrapped Optional: \(implicitOptional)") // John Doe
        
        // オプショナルチェイニング
        class Person {
            var name: String?
        }
        
        let person = Person()
        person.name = "Jane Doe"
        
        let personName = person.name
        print("Optional Chaining: \(personName)") // Optional("Jane Doe")
    }
}
