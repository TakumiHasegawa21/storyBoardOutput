//
//  ViewController.swift
//  storyboardOutput
//
//  Created by 長谷川拓海 on 2024/01/09.
//  Copyright (c) 2024 *ReNKCHANNEL*. All rights reserved.
//

import UIKit

// 値型の例
struct PointStruct {
    var x: Int
    var y: Int
}

// 参照型の例
class PointClass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 値型のインスタンスを作成
        var pointStructA = PointStruct(x: 1, y: 2)
        var pointStructB = pointStructA // pointStructAのコピーが作成される
        
        // 値型の変更
        pointStructB.x = 10
        
        print("pointStructA.x: \(pointStructA.x)") // 1
        print("pointStructB.x: \(pointStructB.x)") // 10
        
        // 参照型のインスタンスを作成
        let pointClassA = PointClass(x: 1, y: 2)
        let pointClassB = pointClassA // 同じインスタンスへの参照が渡される
        
        // 参照型の変更
        pointClassB.x = 10
        
        print("pointClassA.x: \(pointClassA.x)") // 10
        print("pointClassB.x: \(pointClassB.x)") // 10
    }
}
