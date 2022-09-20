import UIKit
import AUIKit

extension TableViewHeaderFooterController {
class Header: AUITableViewHeaderFooter {
    
    // MARK: - Subviews
    
    let idLabel = UILabel()
    let debugButton = UIButton()
    let insertAtSectionBeginingButton = UIButton()
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        contentView.backgroundColor = .lightGray
        backgroundColor = .lightGray
        contentView.addSubview(idLabel)
        contentView.addSubview(debugButton)
        contentView.addSubview(insertAtSectionBeginingButton)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIdLabel()
        layoutDebugButton()
        layoutInsertAtSectionBeginingButton()
    }
    
    private func layoutIdLabel() {
        idLabel.textAlignment = .center
        let x: CGFloat = 16
        let y: CGFloat = 16
        let width = bounds.width - 2 * x
        let height = idLabel.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude)).height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        idLabel.frame = frame
    }
    
    private func layoutDebugButton() {
        let width = (bounds.width - 2 * 16) / 2
        let height = debugButton.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude)).height
        let y: CGFloat = 16
        let x: CGFloat = bounds.width - 16 - width
        let frame = CGRect(x: x, y: y, width: width, height: height)
        debugButton.frame = frame
    }
    
    private func layoutInsertAtSectionBeginingButton() {
        insertAtSectionBeginingButton.titleLabel?.textAlignment = .center
        let x: CGFloat = 16
        let y: CGFloat = idLabel.frame.maxY + 16
        let width = bounds.width - 2 * x
        let height = insertAtSectionBeginingButton.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude)).height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        insertAtSectionBeginingButton.frame = frame
    }
    
}
}
