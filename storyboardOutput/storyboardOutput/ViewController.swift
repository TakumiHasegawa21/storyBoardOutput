//
//  ViewController.swift
//  storyboardOutput
//
//  Created by 長谷川拓海 on 2024/01/09.
//  Copyright (c) 2024 *ReNKCHANNEL*. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var fetchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func fetchButtonTapped(_ sender: UIButton) {
        guard let postalCode = textField.text, !postalCode.isEmpty else {
            addressLabel.text = "郵便番号を入力してください"
            return
        }
        getAddress(from: postalCode) { [weak self] address in
            DispatchQueue.main.async {
                self?.addressLabel.text = address
            }
        }
    }
    
    private func getAddress(from postalCode: String, completion: @escaping (String) -> Void) {
        let baseURL = "https://api.zipaddress.net/"
        let urlString = "\(baseURL)?zipcode=\(postalCode)"
        print(urlString)
                
        guard let url = URL(string: urlString) else {
            completion("エラーが発生しました")
            return
        }
                
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching address: \(error)")
                completion("エラーが発生しました")
                return
            }
                    
            guard let data = data else {
                completion("住所が見つかりませんでした")
                return
            }
                    
            do {
                let decoder = JSONDecoder()
                let addressResponse = try decoder.decode(AddressResponse.self, from: data)
                        
                guard let address = addressResponse.data?.fullAddress else {
                    completion("住所が見つかりませんでした")
                    return
                }
                        
                completion(address)
            } catch {
                print("Error decoding address: \(error)")
                completion("エラーが発生しました")
            }
        }.resume()
    }
}
