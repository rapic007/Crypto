import UIKit
import SDWebImage

class CoinCell: UITableViewCell {
    
    static let identifier = "CoinCell"
    
    //MARK: - Variables
    private(set) var coin: Coin!
    
    //MARK: - UI Components
    private let coinLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "square.and.arrow.up.fill")
        iv.tintColor = .black
 
        return iv
    }()
    
    private let coinName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with coin: Coin) {
        self.coin = coin
        self.coinName.text = coin.name
        self.coinLogo.sd_setImage(with: coin.logoURL)
    }
    
    
    // TODO: PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        self.coinName.text = nil
        self.coinLogo.image = nil
    }
    
    //MARK: - UI Setup
    private func setupUI() {
        
        [coinLogo, coinName].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            coinLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinLogo.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            coinLogo.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            coinLogo.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            
        
            coinName.leadingAnchor.constraint(equalTo: coinLogo.trailingAnchor, constant: 16),
            coinName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
