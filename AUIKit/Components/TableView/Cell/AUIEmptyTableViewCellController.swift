import UIKit

open class AUIEmptyTableViewCellController: AUIEmptyViewController, AUITableViewCellController {
    
    // MARK: - Prefetching
    
    open func prefetchCell() {
        
    }
    
    open func cancelPrefetchingForCell() {
        
    }
    
    // MARK: - Cell
    
    open var cellType: UITableViewCell.Type { return UITableViewCell.self }
    
    open var cellIdentifier: String { return String(describing: cellType.self) }
  
    open var cell: UITableViewCell? {
        set { view = newValue }
        get { return view as? UITableViewCell }
    }
  
    open override func setupView() {
        super.setupView()
        setupCell()
    }
  
    open func setupCell() {
        
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupCell()
    }
  
    open func unsetupCell() {
    
    }
    
    // MARK: - Height
  
    open var estimatedHeight: CGFloat {
        return 0
    }
  
    open var height: CGFloat {
        return 0
    }
    
    // MARK: - Events
  
    open var willDisplay: (() -> Void)?
    
    open func willDisplayCell() {
        guard let willDisplay = willDisplay else { return }
        willDisplay()
    }
    
    open var didSelect: (() -> Void)?
    
    open func didSelectCell() {
        guard let didSelect = didSelect else { return }
        didSelect()
    }
    
    open var didEndDisplaying: (() -> Void)?
    
    open func didEndDisplayingCell() {
        guard let didEndDisplaying = didEndDisplaying else { return }
        didEndDisplaying()
    }
    
    // MARK: - Swiping
    
    @available(iOS 11.0, *)
    open var leadingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? {
        return nil
    }
    
    @available(iOS 11.0, *)
    open var trailingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? {
        return nil
    }
    
    // MARK: - Moving
    
    @available(iOS 11.0, *)
    open func itemsForBeginning(session: UIDragSession) -> [UIDragItem] {
        return []
    }
    
    open var canMoveCell: Bool {
        return false
    }
  
}
