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
        return "Цена $: \(self.coin.pricingData.Dollar.price) $"
    }
    
    var marketCapLabel: String {
        return "Рыночная капитализация: \(self.coin.pricingData.Dollar.marketCap) $"
    }
    
    var maxSupplyLabel : String {
        
        if let maxSupply = self.coin.maxSupply {
            return "Макисмальное количество: \(self.coin.maxSupply)"
        } else {
            return "SSDDDDSD"
        }
    }
}
