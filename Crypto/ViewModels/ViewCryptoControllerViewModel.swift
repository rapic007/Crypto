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
        
        return "Rank:".localized() + " \(self.coin.rank)"
    }

    var priceLabel: String {
        return "Price:".localized() + " \(self.coin.pricingData.USD.price) $"
    }
    
    var marketCapLabel: String {
        return "Market Cap:".localized() + " \(self.coin.pricingData.USD.marketCap) $"
    }
    
    var maxSupplyLabel : String {
        
        if let maxSupply = self.coin.maxSupply {
            return "Max Supply:".localized() + " \(maxSupply)"
        } else {
            return "Max Supply:".localized() + " -"
        }
    }
    
}
