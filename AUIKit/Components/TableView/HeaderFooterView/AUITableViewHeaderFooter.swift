import UIKit

open class AUITableViewHeaderFooterView: UITableViewHeaderFooterView {

    // MARK: - Initialization
  
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
  
    @available(*, unavailable)
    public convenience required init?(coder aDecoder: NSCoder) {
        return nil
    }
  
    // MARK: - Setup
  
    open func setup() {
      
    }

}
