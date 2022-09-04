import UIKit

open class AUIScrollView: UIScrollView {

    // MARK: Initializers

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
        autoLayout()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        autoLayout()
    }

    // MARK: Setup

    open func setup() {

    }

    // MARK: AutoLayout

    open func autoLayout() {

    }
    
}
