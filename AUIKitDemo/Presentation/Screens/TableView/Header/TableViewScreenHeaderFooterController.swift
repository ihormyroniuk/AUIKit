import UIKit
import AUIKit

class TableViewHeaderFooterController: AUIEmptyTableViewHeaderFooterController {
    
    // MARK: - Data
    
    let id: Int
    
    // MARK: - Events
    
    var insertAtSectionBegining: (() -> Void)?
    
    // MARK: - Initialization
    
    init(id: Int) {
        self.id = id
        super.init()
    }
    
    // MARK: - Header
    
    override var headerFooterType: UITableViewHeaderFooterView.Type { return Header.self }
    
    var header: Header? {
        return headerFooter as? Header
    }
    
    override func setupHeaderFooterView() {
        super.setupHeaderFooterView()
        header?.idLabel.text = "\(id)"
        header?.debugButton.setTitle("Debug", for: .normal)
        header?.debugButton.addTarget(self, action: #selector(debugButtonTouchUpInsideAction), for: .touchUpInside)
        header?.insertAtSectionBeginingButton.setTitle("Insert At Section Begining", for: .normal)
        header?.insertAtSectionBeginingButton.addTarget(self, action: #selector(insertAtSectionBeginingButtonTouchUpInsideAction), for: .touchUpInside)
    }
    
    override func unsetupHeaderFooterView() {
        super.unsetupHeaderFooterView()
        header?.debugButton.removeTarget(self, action: #selector(debugButtonTouchUpInsideAction), for: .touchUpInside)
        header?.insertAtSectionBeginingButton.removeTarget(self, action: #selector(insertAtSectionBeginingButtonTouchUpInsideAction), for: .touchUpInside)
    }
    
    // MARK: - Height
    
    override func headerFooterEstimatedHeight(_ width: CGFloat) -> CGFloat {
        return 120
    }
    
    override func headerFooterHeight(_ width: CGFloat) -> CGFloat {
        return 120
    }
    
    // MARK: - Actions
    
    @objc private func debugButtonTouchUpInsideAction() {
        print(id)
    }
    
    @objc private func insertAtSectionBeginingButtonTouchUpInsideAction() {
        guard let insertAtSectionBegining = insertAtSectionBegining else { return }
        insertAtSectionBegining()
    }
    
}
