import UIKit
import AUIKit

@available(iOS 11.0, *)
extension TableViewScreenViewController {
class CellController: AUIClosuresTableViewCellController {
    
    let i: Int
    let color: UIColor
    
    init(i: Int, color: UIColor) {
        self.i = i
        self.color = color
        super.init()
    }
    
    override func setupCell() {
        super.setupCell()
        cell?.textLabel?.text = "text #\(i)"
        cell?.detailTextLabel?.text = "detail #\(i)"
        cell?.contentView.backgroundColor = color
    }
    
    override func cellEstimatedHeight(_ width: CGFloat) -> CGFloat {
        return 64
    }
    
    override func cellHeight(_ width: CGFloat) -> CGFloat {
        return 64
    }
    
}
}
