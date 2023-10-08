import UIKit

class ViewCryptoControllerViewModel {
        
    //MARK: - Variables
    let coin: Coin
    
    //MARK: - Initializer
    init(_ coin: Coin) {
        self.coin = coin
    }
    
    //MARK: - Computed Properties
    var rankLabel: String {
        return "Позиция: \(self.coin.rank)"
    }
        
    var priceLabel: String {
        return "Цена: \(self.coin.pricingData.USD.price) $"
    }
    
    var marketCapLabel: String {
        return "Капитализация: \(self.coin.pricingData.USD.marketCap) $"
    }
    
    var maxSupplyLabel : String {
        
        if let maxSupply = self.coin.maxSupply {
            return "Макисмальное кол-во: \(maxSupply)"
        } else {
            return "Макисмальное кол-во: - "
        }
    }
}
