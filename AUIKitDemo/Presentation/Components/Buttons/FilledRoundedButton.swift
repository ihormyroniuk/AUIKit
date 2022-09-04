import AUIKit

class FilledRoundedButton: AUIButton {
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .highlighted)
        backgroundColor = .black
        clipsToBounds = true
        layer.cornerRadius = 24
    }
    
    // MARK: Highlighted
    
    override var isHighlighted: Bool {
        willSet {
            willSetIsHighlighted(newValue)
        }
    }
    
    func willSetIsHighlighted(_ isHighlighted: Bool) {
        alpha = isHighlighted ? 0.6 : 1.0
    }
    
    // MARK: Size
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let height: CGFloat = 48
        let sizeThatFits = CGSize(width: size.width, height: height)
        return sizeThatFits
    }
    
}
