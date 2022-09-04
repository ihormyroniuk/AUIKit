import UIKit

open class AUICollectionViewCell: UICollectionViewCell {
  
    // MARK: - Initialization
    
    override public init(frame: CGRect) {
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
    
    // MARK: - Layout
  
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutContentView()
    }
    
    open func layoutContentView() {
        contentView.frame = self.bounds
    }
    
}
