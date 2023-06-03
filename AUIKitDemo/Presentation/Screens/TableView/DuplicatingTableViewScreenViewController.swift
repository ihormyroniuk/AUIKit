import UIKit
import AUIKit

final class DuplicatingTableViewScreenViewController: UIViewController {
    
    override func loadView() {
        view = TableViewScreenView()
    }
    
    private var tableViewScreenView: TableViewScreenView! {
        return view as? TableViewScreenView
    }
    
    // MARK: Components
    
    private let tableViewController = AUIEmptyTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setContent()
        setupTableViewController()
    }
    
    private func setupTableViewController() {
        tableViewController.tableView = tableViewScreenView.tableView
        tableViewController.dragInteractionEnabled = true
        var sectionControllers: [AUITableViewSectionController] = []
        for section in 1...10 {
            let sectionController = AUIEmptyTableViewSectionController()
            var cellControllers: [AUITableViewCellController] = []
            for _ in 1...10 {
                if #available(iOS 11.0, *) {
                    let cellConroller = initializeCellController()
                    cellControllers.append(cellConroller)
                }
            }
            sectionController.cellControllers = cellControllers
            sectionControllers.append(sectionController)
        }
        
        tableViewController.insertSectionsAtBeginning(sectionControllers)
    }
    
    private var cellId: Int = 1
    @available(iOS 11.0, *)
    private func initializeCellController() -> TableViewScreenViewController.CellController {
        let id = cellId
        cellId += 1
        let color = cellId > 50 ? UIColor.blue : UIColor.yellow
        let cellConroller = TableViewScreenViewController.CellController(i: id, color: color)
//        cellConroller.willDisplay = {
//            print("willDisplayCellClosure #\(id)")
//        }
        cellConroller.didSelect = { [weak self] in
            guard let self = self else { return }
//            self.tableViewController.deleteCellControllerAnimated(cellConroller, .fade, completion: { finished in
//                print("deleteCellControllerAnimated finished")
//            })
            self.tableViewController.scrollToCellController(cellConroller, at: .middle, animated: true)
        }
//        cellConroller.didEndDisplaying = {
//            print("didEndDisplayingCellClosure #\(id)")
//        }
//        cellConroller.prefetchCellClosure = {
//            print("prefetchCellClosure #\(id)")
//        }
//        cellConroller.cancelPrefetchingForCellClosure = {
//            print("cancelPrefetchingForCellClosure #\(id)")
//        }
        cellConroller.trailingSwipeActionsConfigurationForCellClosure = {
            let deleteContextualAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] contextualAction, view, completion in
                guard let self = self else { return }
                self.tableViewController.deleteCellControllerAnimated(cellConroller, .right, completion: { finished in
                    completion(false)
                })
            }
            let configuration = UISwipeActionsConfiguration(actions: [deleteContextualAction])
            configuration.performsFirstActionWithFullSwipe = true
            return configuration
        }
        cellConroller.canMoveCellClosure = {
            return true
        }
        return cellConroller
    }
}
