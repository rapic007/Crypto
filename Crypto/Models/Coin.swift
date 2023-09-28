import UIKit

struct CoinArray: Decodable {
    let data: [Coin]
}
struct Coin: Decodable {
    
    let id: Int
    let name: String
    let maxSupply: Int?
    let rank: Int
    let pricingData: PricingData
    
    var logoURL: URL? {
        return URL(string: "https://s2.coinmarketcap.com/static/img/coins/200x200/\(id).png")
    }
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case maxSupply = "max_supply"
        case rank = "cmc_rank"
        case pricingData = "quote"
    }
}

struct PricingData: Decodable {
    let Dollar: Dollar
}

struct Dollar: Decodable {
    let price: Double
    let marketCap: Double
    
    enum CodingKeys: String, CodingKey {
        case price = "price"
        case marketCap = "marlet_cap"
    }
}
