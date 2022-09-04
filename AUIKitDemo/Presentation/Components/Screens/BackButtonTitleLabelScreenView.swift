import AUIKit

class BackButtonTitleLabelScreenView: TitleLabelScreenView {
    
    // MARK: Elements
    
    let backButton = IconButton()

    // MARK: Setup
    
    override func setup() {
        super.setup()
        navigationBarView.addSubview(backButton)
        setupBackButton()
    }
    
    func setupBackButton() {
        backButton.tintColor = .black
        if #available(iOS 13.0, *) {
            backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        }
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutBackButton()
    }
    
    override func layoutTitleLabel() {
        let x: CGFloat = 0
        let y: CGFloat = 0
        let width = bounds.width
        let height: CGFloat = 44
        titleLabel.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    func layoutBackButton() {
        let height: CGFloat = 36
        let width = height
        let y = (navigationBarView.bounds.height - height) / 2
        let x = y
        let frame = CGRect(x: x, y: y, width: width, height: height)
        backButton.frame = frame
    }
    
}

