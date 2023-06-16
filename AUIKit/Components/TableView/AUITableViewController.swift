import UIKit

public protocol AUITableViewController: AUIScrollViewController {
    
    // MARK: - UITableView
  
    var tableView: UITableView? { get set }
    
    // MARK: - Prefetching
    
    var isPrefetchingEnabled: Bool { get }
    
    // MARK: - Drag and Drop Interaction
    
    var dragInteractionEnabled: Bool { get }
    
    // MARK: - Scrolling
    
    func scrollToCellController(_ cellController: AUITableViewCellController, at scrollPosition: UITableView.ScrollPosition, animated: Bool)
    
    // MARK: - Reloading
    
    func reloadSection(_ sectionController: AUITableViewSectionController, cellControllers: [AUITableViewCellController])
    
    func reloadCellController(_ cellController: AUITableViewCellController)
    
    func reloadCellController(_ cellController: AUITableViewCellController, animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
        
    // MARK: - Inserting
        
    func insertSectionAtBeginning(_ sectionController: AUITableViewSectionController)
    
    func insertSectionAtBeginningAnimated(_ sectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func insertSectionsAtBeginning(_ sectionControllers: [AUITableViewSectionController])
    
    func insertSectionsAtBeginningAnimated(_ sectionControllers: [AUITableViewSectionController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func insertSectionAtEnd(_ sectionController: AUITableViewSectionController)
    
    func insertSectionAtEndAnimated(_ sectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func insertSectionsAtEnd(_ sectionControllers: [AUITableViewSectionController])
    
    func insertSectionsAtEndAnimated(_ sectionControllers: [AUITableViewSectionController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func insertSection(_ sectionController: AUITableViewSectionController, afterSectionController: AUITableViewSectionController)
    
    func insertSectionAnimated(_ sectionController: AUITableViewSectionController, afterSectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func insertSections(_ sectionControllers: [AUITableViewSectionController], afterSectionController: AUITableViewSectionController)
    
    func insertSectionsAnimated(_ sectionControllers: [AUITableViewSectionController], afterSectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)

    func insertCellControllerAtSectionBeginning(_ section: AUITableViewSectionController, cellController: AUITableViewCellController)
    
    func insertCellControllerAtSectionBeginningAnimated(_ section: AUITableViewSectionController, cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func insertCellControllerAtSectionEnd(_ section: AUITableViewSectionController, cellController: AUITableViewCellController)
    
    func insertCellControllerAtSectionEndAnimated(_ section: AUITableViewSectionController, cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
  
    func insertCellControllers(_ cellControllers: [AUITableViewCellController], afterCellController cellController: AUITableViewCellController, inSection section: AUITableViewSectionController)
    
    func insertCellControllers(_ cellControllers: [AUITableViewCellController], afterCellController cellController: AUITableViewCellController, inSection section: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    // MARK: - Deleting
    
    func deleteSectionController(_ deletingSectionController: AUITableViewSectionController)
    
    func deleteSectionControllerAnimated(_ deletingSectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func deleteSectionControllers(_ deletingSectionControllers: [AUITableViewSectionController])
  
    func deleteSectionControllersAnimated(_ deletingSectionControllers: [AUITableViewSectionController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func deleteCellController(_ cellController: AUITableViewCellController)
    
    func deleteCellControllerAnimated(_ cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func deleteCellControllers(_ cellControllers: [AUITableViewCellController])
  
    func deleteCellControllersAnimated(_ cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    // MARK: - Moving
    
    func moveCellController(_ movingCellController: AUITableViewCellController, toSectionControllerBeginning toSectionController: AUITableViewSectionController)
    
    func moveCellController(_ movingCellController: AUITableViewCellController, toSectionControllerBeginning toSectionController: AUITableViewSectionController, animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
    func moveCellController(_ movingCellController: AUITableViewCellController, afterCellController: AUITableViewCellController)
    
    func moveCellController(_ movingCellController: AUITableViewCellController, afterCellController: AUITableViewCellController, animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    
}
