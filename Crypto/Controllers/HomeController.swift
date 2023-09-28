import UIKit

class HomeController: UIViewController {
    //MARK: - Variables
    private let coins: [Coin] =  [
        Coin(id: 1, name: "Bitcoin", maxSupply: 200, rank: 1, pricingData: PricingData(Dollar: Dollar(price: 50000, marketCap: 1_000_000))),
        Coin(id: 2, name: "Ethereum", maxSupply: nil, rank: 2, pricingData: PricingData(Dollar: Dollar(price: 2000, marketCap: 500_000))),
        Coin(id: 3, name: "Monero", maxSupply: nil, rank: 3, pricingData: PricingData(Dollar: Dollar(price: 200, marketCap: 250_000))),
    ]

    
    //MARK: - UI Components
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.register(CoinCell.self, forCellReuseIdentifier: CoinCell.identifier)
        return tv
    }()
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    //MARK: - UI Setup
    private func setupUI() {
        
        self.navigationItem.title = "Crypto"
        self.view.backgroundColor = .systemBackground
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
    
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    //MARK: - Selectors

}

//MARK: TableView Functions
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell else {
            fatalError("Unable to deque CoinCell in HomeController")
        }
        
        let coin = self.coins[indexPath.row]
        cell.configure(with: coin)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let coin = self.coins[indexPath.row]
        let vm = ViewCryptoControllerViewModel(coin)
        let vc = ViewCryptoController(vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
