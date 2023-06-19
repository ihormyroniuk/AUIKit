import AUIKit

protocol TableViewScreenViewControllerDelegate: AnyObject {
    func tableViewScreenViewControllerBack(_ testTableViewScreenViewController: TableViewScreenViewController)
}

final class TableViewScreenViewController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: TableViewScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = TableViewScreenView()
    }
    
    private var tableViewScreenView: TableViewScreenView! {
        return view as? TableViewScreenView
    }
    
    // MARK: Components
    
    private let tableViewController = AUIEmptyTableViewController()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
        setupTableViewController()
//        tableViewController.scrollViewDidScrollClosure = {
//            print("fffff")
//        }
        tableViewController.didEndScrollingAnimation = {
            print("scrollViewDidEndScrollingAnimationClosure")
        }
        tableViewController.didEndDecelerating = {
            print("scrollViewWillBeginDraggingClosure")
        }
    }
    
    var sectionControllers: [AUITableViewSectionController] = []
    
    private func setupTableViewController() {
        tableViewController.tableView = tableViewScreenView.tableView
        tableViewController.dragInteractionEnabled = true
        var sectionControllers: [AUITableViewSectionController] = []
        for section in 1...2 {
            let sectionController = AUIEmptyTableViewSectionController()
            var cellControllers: [AUITableViewCellController] = []
            for _ in 1...10 {
                if #available(iOS 11.0, *) {
                    let cellConroller = initializeCellController()
                    cellControllers.append(cellConroller)
                }
            }
            let headerController = TableViewHeaderFooterViewController(id: section)
            headerController.insertAtSectionBegining = { [weak self, weak sectionController] in
                guard let self = self else { return }
                guard let sectionController = sectionController else { return }
                self.insertAtSectionBegining(sectionController)
            }
            headerController.delete = { [weak self, weak sectionController] in
                guard let self = self else { return }
                guard let sectionController = sectionController else { return }
                self.deleteSectionController(sectionController)
            }
            sectionController.headerController = headerController
            sectionController.cellControllers = cellControllers
            sectionControllers.append(sectionController)
        }
        self.sectionControllers = sectionControllers
        tableViewController.insertSectionsAtBeginning(sectionControllers)
    }
    
    private var cellId: Int = 1
    @available(iOS 11.0, *)
    private func initializeCellController() -> CellController {
        let id = cellId
        cellId += 1
        let cellConroller = CellController(i: id)
        cellConroller.willDisplay = {
            print("willDisplayCellClosure #\(id)")
        }
        cellConroller.didSelect = { [weak self] in
            guard let self = self else { return }
//            self.tableViewController.deleteCellControllerAnimated(cellConroller, .fade, completion: { finished in
//                print("deleteCellControllerAnimated finished")
//            })
            self.tableViewController.scrollToCellController(cellConroller, at: .middle, animated: true)
        }
        cellConroller.didEndDisplaying = {
            print("didEndDisplayingCellClosure #\(id)")
        }
        cellConroller.prefetchCellClosure = {
            print("prefetchCellClosure #\(id)")
        }
        cellConroller.cancelPrefetchingForCellClosure = {
            print("cancelPrefetchingForCellClosure #\(id)")
        }
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

    // MARK: Actions
    
    @objc private func back() {
        delegate?.tableViewScreenViewControllerBack(self)
    }
    
    private func insertAtSectionBegining(_ sectionController: AUITableViewSectionController) {
        if #available(iOS 11.0, *) {
            let cellController = initializeCellController()
            tableViewController.insertCellControllerAtSectionBeginningAnimated(sectionController, cellController: cellController, .automatic) { success in
                print("insertAtSectionBegining success: \(success)")
            }
        }
    }
    
    private func deleteSectionController(_ sectionController: AUITableViewSectionController) {
        tableViewController.deleteSectionControllersAnimated(sectionControllers, .automatic) { success in
            print("deleteSectionController success: \(success)")
        }
    }
    
    // MARK: Content
    
    private func setContent() {
        tableViewScreenView.titleLabel.text = "TableView"
    }
    
}
