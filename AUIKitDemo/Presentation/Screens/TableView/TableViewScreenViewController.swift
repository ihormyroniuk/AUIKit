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
        var sectionControllers: [AUITableViewSectionController] = []
        for section in 1...10 {
            let sectionController = AUIEmptyTableViewSectionController()
            var cellControllers: [AUITableViewCellController] = []
            for row in 1...10 {
                let cellConroller = initializeCellController()
                cellControllers.append(cellConroller)
            }
            let headerController = TableViewSectionHeaderController(id: section)
            headerController.insertAtSectionBegining = { [weak self, weak sectionController] in
                guard let self = self else { return }
                guard let sectionController = sectionController else { return }
                self.insertAtSectionBegining(sectionController)
            }
            sectionController.headerController = headerController
            sectionController.cellControllers = cellControllers
            sectionControllers.append(sectionController)
        }
        
        tableViewController.insertSectionsAtBeginning(sectionControllers)
    }
    
    private var cellId: Int = 1
    private func initializeCellController() -> CellController {
        let id = cellId
        cellId += 1
        let cellConroller = CellController(i: id)
        cellConroller.willDisplay = {
            print("willDisplayCellClosure #\(id)")
        }
        cellConroller.didSelect = { [weak self] in
            guard let self = self else { return }
            self.tableViewController.deleteCellControllerAnimated(cellConroller, .fade, completion: { finished in
                print("deleteCellControllerAnimated finished")
            })
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
        let cellController = initializeCellController()
        tableViewController.insertCellControllerAtSectionBeginningAnimated(sectionController, cellController: cellController, .automatic) { success in
            print("insertAtSectionBegining success: \(success)")
        }
    }
    
    // MARK: Content
    
    private func setContent() {
        tableViewScreenView.titleLabel.text = "TableView"
    }
    
}

class TableViewSectionHeaderController: AUIEmptyTableViewHeaderFooterController {
    
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
        header?.insertAtSectionBeginingButton.setTitle("Insert At Section Begining", for: .normal)
        header?.insertAtSectionBeginingButton.addTarget(self, action: #selector(insertAtSectionBeginingButtonTouchUpInsideAction), for: .touchUpInside)
    }
    
    override func unsetupHeaderFooterView() {
        super.unsetupHeaderFooterView()
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
    
    @objc private func insertAtSectionBeginingButtonTouchUpInsideAction() {
        guard let insertAtSectionBegining = insertAtSectionBegining else { return }
        insertAtSectionBegining()
    }
    
}

extension TableViewSectionHeaderController {
class Header: AUITableViewHeaderFooter {
    
    // MARK: - Subviews
    
    let idLabel = UILabel()
    let insertAtSectionBeginingButton = UIButton()
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        contentView.backgroundColor = .lightGray
        backgroundColor = .lightGray
        contentView.addSubview(idLabel)
        contentView.addSubview(insertAtSectionBeginingButton)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIdLabel()
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
