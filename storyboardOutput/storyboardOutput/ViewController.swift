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
    }
    
    @IBAction func showActionSheet(_ sender: UIButton) {
        // アクションシートを作成
        let actionSheet = UIAlertController(title: "選択", message: "オプションを選んでください", preferredStyle: .actionSheet)
        
        // 選択肢を作成
        let option1 = UIAlertAction(title: "オプション1", style: .default) { action in
            print("オプション1が選ばれました")
        }
        let option2 = UIAlertAction(title: "オプション2", style: .default) { action in
            print("オプション2が選ばれました")
        }
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel) { action in
            print("キャンセルが選ばれました")
        }
        
        // アクションシートに選択肢を追加
        actionSheet.addAction(option1)
        actionSheet.addAction(option2)
        actionSheet.addAction(cancel)
        
        // アクションシートを表示
        present(actionSheet, animated: true, completion: nil)
    }
}

