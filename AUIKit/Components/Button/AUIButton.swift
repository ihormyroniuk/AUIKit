import UIKit

open class AUIButton: UIButton {

    // MARK: - Initialization

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - Setup

    open func setup() {
        
    }
  
}
