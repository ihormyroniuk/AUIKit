import UIKit
import AUIKit

extension TableViewScreenViewController {
class CellController: AUIClosuresTableViewCellController {
    
    let i: Int
    
    init(i: Int) {
        self.i = i
        super.init()
    }
    
    override func setupCell() {
        super.setupCell()
        cell?.textLabel?.text = "text #\(i)"
        cell?.detailTextLabel?.text = "detail #\(i)"
    }
    
    override func cellEstimatedHeight(_ width: CGFloat) -> CGFloat {
        return 64
    }
    
    override func cellHeight(_ width: CGFloat) -> CGFloat {
        return 64
    }
    
}
}
