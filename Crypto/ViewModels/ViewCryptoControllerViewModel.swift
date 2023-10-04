import UIKit

class ViewCryptoControllerViewModel {
    
    var onImageLoaded:((UIImage?) -> Void)?
    
    //MARK: - Variables
    let coin: Coin
    
    //MARK: - Initializer
    init(_ coin: Coin) {
        self.coin = coin
        self.loadImage()
    }
    
    private func loadImage() {
    
        DispatchQueue.global().async { [weak self] in
            if let logoURl = self?.coin.logoURL,
               let imageData = try? Data(contentsOf: logoURl),
               let logoImage = UIImage(data: imageData) {
                self?.onImageLoaded?(logoImage)
            }
                
        }
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
            return "SSDDDDSD"
        }
    }
}
