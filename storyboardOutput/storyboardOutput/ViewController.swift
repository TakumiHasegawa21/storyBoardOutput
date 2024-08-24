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

        // クロージャの基本例
        let greeting = { (name: String) -> String in
            return "Hello, \(name)!"
        }
        let message = greeting("Swift")
        print(message)  // "Hello, Swift!" と出力される
        
        // クロージャのキャプチャリストの例
        var count = 0
        let increment = { [count] in
            print("Count is \(count)")
        }
        count = 5
        increment()  // "Count is 0" と出力される

        // クロージャの省略記法の例
        let numbers = [1, 2, 3, 4, 5]
        let doubled = numbers.map { $0 * 2 }
        // 省略せずに書くと...
        // let doubled = numbers.map { (number: Int) -> Int in
        //    return number * 2
        // }

        print(doubled)  // [2, 4, 6, 8, 10] と出力される

        // 非同期処理でのクロージャ使用例
        fetchData { data in
            print(data)  // "データ取得完了" と出力される
        }
    }

    // 非同期処理を行うメソッド
    func fetchData(completion: @escaping (String) -> Void) {
        // 非同期タスクの後、データを返す
        DispatchQueue.global().async {
            // 仮のデータを2秒後に返す
            sleep(2)
            completion("データ取得完了")
        }
    }
}
