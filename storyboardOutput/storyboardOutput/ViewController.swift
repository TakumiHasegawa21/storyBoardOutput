//
//  ViewController.swift
//  storyboardOutput
//
//  Created by 長谷川拓海 on 2024/01/09.
//  Copyright (c) 2024 *ReNKCHANNEL*. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loadData(_ sender: UIButton) {
        // プログレスインジケーターを表示
        SVProgressHUD.show(withStatus: "Loading...")
        
        // データのロードをシミュレート（ここでは2秒後に完了とする）
        DispatchQueue.global().async {
            sleep(2) // ネットワークリクエストや重い処理をここに書く
            
            DispatchQueue.main.async {
                // プログレスインジケーターを非表示にする
                SVProgressHUD.dismiss()
                // データがロードされたことをユーザーに通知
                let alert = UIAlertController(title: "完了", message: "データのロードが完了しました", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}


