import UIKit

public protocol AUITableViewController: AUIScrollViewController {
    
    // MARK: - UITableView
  
    var tableView: UITableView? { get set }
    
    // MARK: Sections
        
    func insertSectionAtBeginning(_ sectionController: AUITableViewSectionController)
    func insertSectionAtBeginningAnimated(_ sectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func insertCellControllerAtSectionBeginning(_ section: AUITableViewSectionController, cellController: AUITableViewCellController)
    func insertCellControllerAtSectionBeginningAnimated(_ section: AUITableViewSectionController, cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    func insertCellControllerAtSectionEnd(_ section: AUITableViewSectionController, cellController: AUITableViewCellController)
    func insertCellControllerAtSectionEndAnimated(_ section: AUITableViewSectionController, cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
  
    func insertCellControllers(_ cellControllers: [AUITableViewCellController], afterCellController cellController: AUITableViewCellController, inSection section: AUITableViewSectionController)
    
    func deleteCellController(_ cellController: AUITableViewCellController)
    func deleteCellControllers(_ cellControllers: [AUITableViewCellController])
  
    func deleteCellControllersAnimated(_ cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    func deleteCellControllerAnimated(_ cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    // MARK: Prefetching
    
    var isPrefetchingEnabled: Bool { get }
    
    // MARK: - Drag and Drop Interaction
    
    var dragInteractionEnabled: Bool { get }
    
}
