import UIKit

struct AddressResponse: Codable {
    let data: AddressData?
    
    struct AddressData: Codable {
        let fullAddress: String?
        
        enum CodingKeys: String, CodingKey {
            case fullAddress = "fullAddress"
        }
    }
}
