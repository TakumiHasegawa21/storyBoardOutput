//
//  ViewController.swift
//  storyboardOutput
//
//  Created by 長谷川拓海 on 2024/01/09.
//  Copyright (c) 2024 *ReNKCHANNEL*. All rights reserved.
//

import UIKit
import Alamofire

final class ViewController: UIViewController {
    
    // ラベルとボタンをStoryboardに配置し、IBOutletおよびIBActionを接続
    @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet private weak var fetchDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初期設定などがあればここに書く
    }
    
    @IBAction func fetchDataTapped(_ sender: UIButton) {
        // データを取得するためのURL
        let url = "https://weather.tsukumijima.net/api/forecast/city/400040"
        
        // GETリクエストの送信
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                // レスポンスデータをラベルに表示
                if let json = value as? [String: Any] {
                    self.dataLabel.text = json.
                }
            case .failure(let error):
                // エラーハンドリング
                self.dataLabel.text = "Error: \(error.localizedDescription)"
            }
        }
    }
}
