import UIKit

open class AUITableViewCell: UITableViewCell {
  
    // MARK: - Initialization

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    public convenience required init?(coder aDecoder: NSCoder) {
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
