import UIKit
import AUIKit

class TableViewHeaderFooterViewController: AUIEmptyTableViewHeaderFooterViewController {
    
    // MARK: - Data
    
    let id: Int
    
    // MARK: - Initialization
    
    init(id: Int) {
        self.id = id
        super.init()
    }
    
    // MARK: - Header
    
    override var headerFooterViewType: UITableViewHeaderFooterView.Type { return Header.self }
    
    var header: Header? {
        return headerFooterView as? Header
    }
    
    override func setupHeaderFooterView() {
        super.setupHeaderFooterView()
        header?.idLabel.text = "\(id)"
        header?.debugButton.setTitle("Debug", for: .normal)
        header?.debugButton.addTarget(self, action: #selector(debugButtonTouchUpInsideAction), for: .touchUpInside)
        header?.insertAtSectionBeginingButton.setTitle("Insert At Section Begining", for: .normal)
        header?.insertAtSectionBeginingButton.addTarget(self, action: #selector(insertAtSectionBeginingButtonTouchUpInsideAction), for: .touchUpInside)
        header?.deleteButton.setTitle("Delete", for: .normal)
        header?.deleteButton.addTarget(self, action: #selector(deleteButtonTouchUpInsideAction), for: .touchUpInside)
    }
    
    override func unsetupHeaderFooterView() {
        super.unsetupHeaderFooterView()
        header?.debugButton.removeTarget(self, action: #selector(debugButtonTouchUpInsideAction), for: .touchUpInside)
        header?.insertAtSectionBeginingButton.removeTarget(self, action: #selector(insertAtSectionBeginingButtonTouchUpInsideAction), for: .touchUpInside)
    }
    
    // MARK: - Height
    
    override func headerFooterViewEstimatedHeight(_ width: CGFloat) -> CGFloat {
        return 120
    }
    
    override func headerFooterViewHeight(_ width: CGFloat) -> CGFloat {
        return 120
    }
    
    // MARK: - Actions
    
    @objc private func debugButtonTouchUpInsideAction() {
        print("Section \(id)")
    }
    
    var insertAtSectionBegining: (() -> Void)?
    
    @objc private func insertAtSectionBeginingButtonTouchUpInsideAction() {
        guard let insertAtSectionBegining = insertAtSectionBegining else { return }
        insertAtSectionBegining()
    }
    
    var delete: (() -> Void)?
    
    @objc private func deleteButtonTouchUpInsideAction() {
        guard let delete = delete else { return }
        delete()
    }
    
}
