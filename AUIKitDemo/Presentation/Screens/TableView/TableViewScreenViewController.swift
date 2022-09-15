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
    
    private func setupTableViewController() {
        tableViewController.tableView = tableViewScreenView.tableView
        tableViewController.dragInteractionEnabled = true
        var cellControllers: [AUITableViewCellController] = []
        for i in 1...100 {
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
            let cellConroller = CellController(i: i)
            cellConroller.willDisplay = {
                print("willDisplayCellClosure #\(i)")
            }
            cellConroller.didSelect = { [weak self] in
                guard let self = self else { return }
                self.tableViewController.deleteCellControllerAnimated(cellConroller, .fade, completion: { finished in
                    print("deleteCellControllerAnimated finished")
                })
            }
            cellConroller.didEndDisplaying = {
                print("didEndDisplayingCellClosure #\(i)")
            }
            cellConroller.prefetchCellClosure = {
                print("prefetchCellClosure #\(i)")
            }
            cellConroller.cancelPrefetchingForCellClosure = {
                print("cancelPrefetchingForCellClosure #\(i)")
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
            cellControllers.append(cellConroller)
        }
        let sectionController = AUIEmptyTableViewSectionController()
        sectionController.cellControllers = cellControllers
        tableViewController.insertSectionAtBeginning(sectionController)
    }

    // MARK: Actions
    
    @objc private func back() {
        delegate?.tableViewScreenViewControllerBack(self)
    }
    
    // MARK: Content
    
    private func setContent() {
        tableViewScreenView.titleLabel.text = "TableView"
    }
    
}
