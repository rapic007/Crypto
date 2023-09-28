import UIKit

class CustomLabel: UILabel {
    init() {
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        textColor = .label
        textAlignment = .center
        font = .systemFont(ofSize: 20, weight: .semibold)
        text = ""
    }
}
