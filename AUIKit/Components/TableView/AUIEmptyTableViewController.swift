import UIKit

open class AUIEmptyTableViewController: AUIEmptyScrollViewController, AUITableViewController {
    
    // MARK: - Setup
  
    open override func setup() {
        super.setup()
        tableViewDelegateProxy.emptyTableViewController = self
    }
    
    // MARK: - UITableView
  
    open var tableView: UITableView? {
        set { view = newValue }
        get { return view as? UITableView }
    }
  
    open override func setupView() {
        super.setupView()
        setupTableView()
    }
    
    open func setupTableView() {
        tableView?.dataSource = tableViewDelegateProxy
        tableView?.delegate = tableViewDelegateProxy
        tableView?.prefetchDataSource = tableViewDelegateProxy
        if #available(iOS 11.0, *) {
            tableView?.dragDelegate = tableViewDelegateProxy
            tableView?.dragInteractionEnabled = dragInteractionEnabled
        }
        if #available(iOS 15.0, *) {
            tableView?.isPrefetchingEnabled = isPrefetchingEnabled
        }
        tableView?.reloadData()
    }

    open override func unsetupView() {
        super.unsetupView()
        unsetupTableView()
    }
    
    open func unsetupTableView() {
        tableView?.dataSource = nil
        tableView?.delegate = nil
        tableView?.prefetchDataSource = nil
        if #available(iOS 11.0, *) {
            tableView?.dragDelegate = nil
        }
        cells = [:]
    }
    
    private var isTableViewMounted: Bool {
        return tableView?.window != nil
    }
    
    // MARK: - Drag and Drop Interaction
    
    open var dragInteractionEnabled: Bool = false {
        didSet { didSetDragInteractionEnabled(oldValue) }
    }
    open func didSetDragInteractionEnabled(_ oldValue: Bool) {
        if #available(iOS 11.0, *) {
            tableView?.dragInteractionEnabled = dragInteractionEnabled
        }
    }
    
    // MARK: - Prefetching
    
    open var isPrefetchingEnabled: Bool = true {
        didSet { didSetIsPrefetchingEnabled(oldValue) }
    }
    open func didSetIsPrefetchingEnabled(_ oldValue: Bool) {
        if #available(iOS 15.0, *) {
            tableView?.isPrefetchingEnabled = isPrefetchingEnabled
        }
    }
  
    // MARK: - UITableViewDelegateProxy
  
    private let tableViewDelegateProxy = UITableViewDelegateProxy()
    
    open var sectionControllers: [AUITableViewSectionController] = []
  
    open func numberOfSections() -> Int {
        let numberOfSections = sectionControllers.count
        return numberOfSections
    }
    
    open func headerInSection(_ section: Int) -> UIView? {
        let sectionController = sectionControllers[section]
        guard let headerController = sectionController.headerController else { return nil }
        guard let tableView = tableView else { return UITableViewCell() }
        let headerType = headerController.headerFooterViewType
        let headerIdentifier = headerController.headerFooterViewIdentifier
        tableView.register(headerType, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier)
        headerController.headerFooterView = header
        return header
    }
  
    open func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat {
        let sectionController = sectionControllers[section]
        let headerController = sectionController.headerController
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        guard let estimatedHeight = headerController?.headerFooterViewEstimatedHeight(width) else { return .zero }
        return estimatedHeight
    }
  
    open func heightForHeaderInSection(_ section: Int) -> CGFloat {
        let sectionController = sectionControllers[section]
        let headerController = sectionController.headerController
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        guard let height = headerController?.headerFooterViewHeight(width) else { return .zero }
        return height
    }
  
    open func willDisplayHeaderViewForSection(_ section: Int) {
        let sectionController = sectionControllers[section]
        let headerController = sectionController.headerController
        headerController?.willDisplayHeaderFooterView()
    }
  
    open func didEndDisplayingHeaderInSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        let sectionController = sectionControllers[section]
        let headerController = sectionController.headerController
        headerController?.headerFooterView = nil
        headerController?.didEndDisplayingHeaderFooterView()
    }
      
    open func numberOfRowsInSection(_ section: Int) -> Int {
        let sectionController = sectionControllers[section]
        let cellControllers = sectionController.cellControllers
        let numberOfRows = cellControllers.count
        return numberOfRows
    }
  
    open func prefetchRowsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let section = indexPath.section
            let sectionController = sectionControllers[section]
            let row = indexPath.row
            let cellController = sectionController.cellControllers[row]
            cellController.prefetchCell()
        }
    }
  
    open func cancelPrefetchingForRowsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let section = indexPath.section
            let sectionController = sectionControllers[section]
            let row = indexPath.row
            guard row < sectionController.cellControllers.count else { return }
            let cellController = sectionController.cellControllers[row]
            cellController.cancelPrefetchingForCell()
        }
    }
  
    open func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        guard let tableView = tableView else { return UITableViewCell() }
        let cellType = cellController.cellType
        let cellIdentifier = cellController.cellIdentifier
        tableView.register(cellType, forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let cellCellController = cells[cell]
        if cellController !== cellCellController, cellCellController?.cell === cell {
            cellCellController?.cell = nil
        }
        if cellController.cell !== cell {
            cellController.cell = cell
            cells[cell] = cellController
        }
        return cell
    }
    
    private var cells: [UITableViewCell: AUITableViewCellController] = [:]
  
    open func estimatedHeightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        let estimatedHeight = cellController.cellEstimatedHeight(width)
        return estimatedHeight
    }
  
    open func heightForCellAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        let height = cellController.cellHeight(width)
        return height
    }
  
    open func willDisplayCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath) {
        if deletedIndexPaths.contains(indexPath) {
            deletedIndexPaths = deletedIndexPaths.filter({ $0 != indexPath })
        }
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        return cellController.willDisplayCell()
    }
  
    open func didSelectCellAtIndexPath(_ indexPath: IndexPath) {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        cellController.didSelectCell()
    }
  
    open func didEndDisplayingCellAtIndexPath(_ indexPath: IndexPath) {
        guard indexPath.section < sectionControllers.count else { return }
        if let index = deletedIndexPaths.firstIndex(of: indexPath) {
            deletedIndexPaths.remove(at: index)
            return
        }
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        guard row < sectionController.cellControllers.count else { return }
        let cellController = sectionController.cellControllers[row]
        cellController.didEndDisplayingCell()
    }
    
    @available(iOS 11.0, *)
    open func leadingSwipeActionsConfigurationForRowAtIndexPath(_ indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        let cellLeadingSwipeActionsConfiguration = cellController.cellLeadingSwipeActionsConfiguration
        return cellLeadingSwipeActionsConfiguration
    }
    
    @available(iOS 11.0, *)
    open func trailingSwipeActionsConfigurationForRowAtIndexPath(_ indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        let cellTrailingSwipeActionsConfiguration = cellController.cellTrailingSwipeActionsConfiguration
        return cellTrailingSwipeActionsConfiguration
    }
    
    func canMoveRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        let canMoveCell = cellController.canMoveCell
        return canMoveCell
    }
    
    @available(iOS 11.0, *)
    open func itemsForBeginning(session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        return cellController.itemsForBeginning(session: session)
    }
    
    open func targetIndexPathForMoveFromRowAt(sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return proposedDestinationIndexPath
    }
    
    open func moveRowAt(sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let sourceSection = sourceIndexPath.section
        let sourceSectionController = sectionControllers[sourceSection]
        let sourceItem = sourceIndexPath.item
        let movedCellController = sourceSectionController.cellControllers.remove(at: sourceItem)
        let destinationSection = destinationIndexPath.section
        let destinationSectionController = sectionControllers[destinationSection]
        let destinationItem = destinationIndexPath.item
        destinationSectionController.cellControllers.insert(movedCellController, at: destinationItem)
    }
      
    open func footerInSection(_ section: Int) -> UIView? {
        let sectionController = sectionControllers[section]
        guard let footerController = sectionController.footerController else { return nil }
        guard let tableView = tableView else { return UITableViewCell() }
        let footerType = footerController.headerFooterViewType
        let footerIdentifier = footerController.headerFooterViewIdentifier
        tableView.register(footerType, forHeaderFooterViewReuseIdentifier: footerIdentifier)
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerIdentifier)
        footerController.headerFooterView = footer
        return footer
    }
  
    open func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat {
        let sectionController = sectionControllers[section]
        let footerController = sectionController.footerController
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        guard let estimatedHeight = footerController?.headerFooterViewEstimatedHeight(width) else { return 0 }
        return estimatedHeight
    }
  
    open func heightForFooterInSection(_ section: Int) -> CGFloat {
        let sectionController = sectionControllers[section]
        let footerController = sectionController.footerController
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        guard let height = footerController?.headerFooterViewHeight(width) else { return 0 }
        return height
    }
  
    open func willDisplayFooterViewForSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        let sectionController = sectionControllers[section]
        let footerController = sectionController.footerController
        footerController?.willDisplayHeaderFooterView()
    }
  
    open func didEndDisplayingFooterInSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        let sectionController = sectionControllers[section]
        let footerController = sectionController.footerController
        footerController?.headerFooterView = nil
        footerController?.didEndDisplayingHeaderFooterView()
    }
    
    // MARK: - Scrolling
    
    open func scrollToCellController(_ cellController: AUITableViewCellController, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard let indexPath = indexPathForCellController(cellController) else { return }
        guard let tableView = tableView else { return }
        tableView.scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    // MARK: - Reloading
    
    open func reload() {
        deletedIndexPaths = tableView?.indexPathsForVisibleRows ?? []
        tableView?.reloadData()
    }
    
    open func reloadSection(_ sectionController: AUITableViewSectionController, cellControllers: [AUITableViewCellController]) {
        sectionController.cellControllers = cellControllers
        reload()
    }
    
    open func reloadSectionAnimated(_ sectionController: AUITableViewSectionController, cellControllers: [AUITableViewCellController], animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            reloadSection(sectionController, cellControllers: cellControllers)
            completion?(true)
            return
        }
        guard let section = sectionControllers.firstIndex(where: { $0 === sectionController }) else {
            completion?(true)
            return
        }
        let sections = IndexSet([section])
        sectionController.cellControllers = cellControllers
        guard let tableView = tableView else {
            completion?(true)
            return
        }
        if #available(iOS 11.0, *) {
            tableView.performBatchUpdates({ [weak self] in
                guard let self = self else { return }
                self.tableView?.reloadSections(sections, with: animation)
            }, completion: completion)
        } else {
            tableView.beginUpdates()
            tableView.reloadSections(sections, with: animation)
            tableView.endUpdates()
            completion?(true)
        }
    }
    
    open func reloadCellController(_ cellController: AUITableViewCellController) {
        guard let tableView = tableView else { return }
        tableView.reloadData()
    }
    
    open func reloadCellController(_ cellController: AUITableViewCellController, animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            reloadCellController(cellController)
            completion?(true)
            return
        }
        guard let indexPath = indexPathForCellController(cellController) else {
            completion?(true)
            return
        }
        guard let tableView = tableView else {
            completion?(true)
            return
        }
        let indexPaths = [indexPath]
        if #available(iOS 11.0, *) {
            tableView.performBatchUpdates({
                self.tableView?.reloadRows(at: indexPaths, with: animation)
            }, completion: completion)
        } else {
            tableView.beginUpdates()
            tableView.reloadRows(at: indexPaths, with: animation)
            tableView.endUpdates()
            completion?(true)
        }
    }
    
    // MARK: - Inserting
    
    open func insertSectionAtBeginning(_ sectionController: AUITableViewSectionController) {
        sectionControllers.insert(sectionController, at: 0)
        reload()
    }
    
    open func insertSectionAtBeginningAnimated(_ sectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertSectionAtBeginning(sectionController)
            return
        }
        sectionControllers.insert(sectionController, at: 0)
        let sections: IndexSet = [0]
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.insertSections(sections, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertSections(sections, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    open func insertSectionsAtBeginning(_ sectionControllers: [AUITableViewSectionController]) {
        self.sectionControllers.insert(contentsOf: sectionControllers, at: 0)
        reload()
    }
    
    open func insertSectionsAtBeginningAnimated(_ sectionControllers: [AUITableViewSectionController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertSectionsAtBeginning(sectionControllers)
            return
        }
        self.sectionControllers.insert(contentsOf: sectionControllers, at: 0)
        let sections: IndexSet = IndexSet(integersIn: 0..<sectionControllers.count)
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.insertSections(sections, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertSections(sections, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    open func insertSectionAtEnd(_ sectionController: AUITableViewSectionController) {
        sectionControllers.append(sectionController)
        reload()
    }
    
    open func insertSectionAtEndAnimated(_ sectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertSectionAtEnd(sectionController)
            return
        }
        sectionControllers.append(sectionController)
        let sections: IndexSet = [sectionControllers.count - 1]
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.insertSections(sections, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertSections(sections, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    open func insertSectionsAtEnd(_ sectionControllers: [AUITableViewSectionController]) {
        self.sectionControllers.append(contentsOf: sectionControllers)
        reload()
    }
    
    open func insertSectionsAtEndAnimated(_ sectionControllers: [AUITableViewSectionController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertSectionsAtEnd(sectionControllers)
            return
        }
        self.sectionControllers.append(contentsOf: sectionControllers)
        let sections: IndexSet = IndexSet(integersIn: (self.sectionControllers.count - sectionControllers.count)..<self.sectionControllers.count)
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.insertSections(sections, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertSections(sections, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    open func insertSection(_ sectionController: AUITableViewSectionController, afterSectionController: AUITableViewSectionController) {
        insertSections([sectionController], afterSectionController: afterSectionController)
    }
    
    open func insertSectionAnimated(_ sectionController: AUITableViewSectionController, afterSectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        insertSectionsAnimated([sectionController], afterSectionController: afterSectionController, animation, completion: completion)
    }
    
    open func insertSections(_ sectionControllers: [AUITableViewSectionController], afterSectionController: AUITableViewSectionController) {
        guard let index = self.sectionControllers.firstIndex(where: { $0 === afterSectionController }) else { return }
        self.sectionControllers.insert(contentsOf: sectionControllers, at: index + 1)
        reload()
    }
    
    open func insertSectionsAnimated(_ sectionControllers: [AUITableViewSectionController], afterSectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertSections(sectionControllers, afterSectionController: afterSectionController)
            return
        }
        guard let index = self.sectionControllers.firstIndex(where: { $0 === afterSectionController }) else { return }
        let insertingIndex = index + 1
        self.sectionControllers.insert(contentsOf: sectionControllers, at: insertingIndex)
        let sections: IndexSet = IndexSet(integersIn: (insertingIndex..<insertingIndex + sectionControllers.count))
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                tableView?.insertSections(sections, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertSections(sections, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    open func insertCellControllerAtSectionBeginning(_ section: AUITableViewSectionController, cellController: AUITableViewCellController) {
        section.cellControllers.insert(cellController, at: 0)
        reload()
    }
    
    open func insertCellControllerAtSectionBeginningAnimated(_ section: AUITableViewSectionController, cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertCellControllerAtSectionBeginning(section, cellController: cellController)
            return
        }
        section.cellControllers.insert(cellController, at: 0)
        let indexPathsBySections = indexPathsBySectionsForCellControllers([cellController])
        let indexPaths = indexPathsBySections.values.reduce([], +)
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.insertRows(at: indexPaths, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertRows(at: indexPaths, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    open func insertCellControllersAtSectionBeginning(_ section: AUITableViewSectionController, cellControllers: [AUITableViewCellController]) {
        section.cellControllers.insert(contentsOf: cellControllers, at: 0)
        reload()
    }
    
    open func insertCellControllersAtSectionBeginningAnimated(_ section: AUITableViewSectionController, cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertCellControllersAtSectionBeginning(section, cellControllers: cellControllers)
            return
        }
        section.cellControllers.insert(contentsOf: cellControllers, at: 0)
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        let indexPaths = indexPathsBySections.values.reduce([], +)
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.insertRows(at: indexPaths, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertRows(at: indexPaths, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    open func insertCellControllerAtSectionEnd(_ section: AUITableViewSectionController, cellController: AUITableViewCellController) {
        section.cellControllers.append(cellController)
        reload()
    }
    
    open func insertCellControllerAtSectionEndAnimated(_ section: AUITableViewSectionController, cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertCellControllerAtSectionEnd(section, cellController: cellController)
            return
        }
        section.cellControllers.append(cellController)
        let indexPathsBySections = indexPathsBySectionsForCellControllers([cellController])
        let indexPaths = indexPathsBySections.values.reduce([], +)
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.insertRows(at: indexPaths, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertRows(at: indexPaths, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    
    
    open func insertCellControllersAtSectionEnd(_ section: AUITableViewSectionController, cellControllers: [AUITableViewCellController]) {
        section.cellControllers.append(contentsOf: cellControllers)
        reload()
    }
    
    open func insertCellControllersAtSectionEndAnimated(_ section: AUITableViewSectionController, cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertCellControllersAtSectionEnd(section, cellControllers: cellControllers)
            return
        }
        section.cellControllers.append(contentsOf: cellControllers)
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        let indexPaths = indexPathsBySections.values.reduce([], +)
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.insertRows(at: indexPaths, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertRows(at: indexPaths, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    
    
  
    open func insertCellControllers(_ cellControllers: [AUITableViewCellController], afterCellController cellController: AUITableViewCellController, inSection section: AUITableViewSectionController) {
        guard let index = section.cellControllers.firstIndex(where: { $0 === cellController }) else { return }
        section.cellControllers.insert(contentsOf: cellControllers, at: index + 1)
        reload()
    }
    
    open func insertCellControllers(_ cellControllers: [AUITableViewCellController], afterCellController cellController: AUITableViewCellController, inSection section: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            insertCellControllers(cellControllers, afterCellController: cellController, inSection: section)
            return
        }
        guard let index = section.cellControllers.firstIndex(where: { $0 === cellController }) else { return }
        section.cellControllers.insert(contentsOf: cellControllers, at: index + 1)
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        let indexPaths = indexPathsBySections.values.reduce([], +)
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.insertRows(at: indexPaths, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.insertRows(at: indexPaths, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    // MARK: - Deleting
    
    open func deleteSectionController(_ deletingSectionController: AUITableViewSectionController) {
        sectionControllers.removeAll(where: { $0 === deletingSectionController })
        reload()
    }
    
    open func deleteSectionControllerAnimated(_ deletingSectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        let deletingSectionControllers = [deletingSectionController]
        deleteSectionControllersAnimated(deletingSectionControllers, animation, completion: completion)
    }
    
    open func deleteSectionControllers(_ deletingSectionControllers: [AUITableViewSectionController]) {
        sectionControllers.removeAll(where: { sectionController in
            deletingSectionControllers.contains { deletingSectionController in
                return sectionController === deletingSectionController
        }})
        reload()
    }
  
    open func deleteSectionControllersAnimated(_ deletingSectionControllers: [AUITableViewSectionController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            deleteSectionControllers(deletingSectionControllers)
            return
        }
        var sections: IndexSet = []
        for deletingSectionController in deletingSectionControllers {
            if let section = sectionControllers.firstIndex(where: { $0 === deletingSectionController }) {
                sections.insert(section)
            }
        }
        sectionControllers.removeAll(where: { sectionController in
            deletingSectionControllers.contains { deletingSectionController in
                return sectionController === deletingSectionController
        }})
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.deleteSections(sections, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.deleteSections(sections, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    open func deleteCellController(_ cellController: AUITableViewCellController) {
        deleteCellControllers([cellController])
    }
    
    open func deleteCellControllerAnimated(_ cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        deleteCellControllersAnimated([cellController], animation, completion: completion)
    }
  
    open func deleteCellControllers(_ cellControllers: [AUITableViewCellController]) {
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        for (section, indexPaths) in indexPathsBySections {
            let rows = indexPaths.map({ $0.row })
            sectionControllers[section].cellControllers = sectionControllers[section].cellControllers.enumerated().filter({ !rows.contains($0.offset) }).map({ $0.element })
        }
        reload()
    }
  
    open var deletedIndexPaths: [IndexPath] = []
    open func deleteCellControllersAnimated(_ cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            deleteCellControllers(cellControllers)
            return
        }
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        let indexPaths = indexPathsBySections.values.reduce([], +)
        deletedIndexPaths = indexPaths
        deletedIndexPaths = indexPaths + indexPaths
        for (section, indexPaths) in indexPathsBySections {
            let rows = indexPaths.map({ $0.row })
            sectionControllers[section].cellControllers = sectionControllers[section].cellControllers.enumerated().filter({ !rows.contains($0.offset) }).map({ $0.element })
        }
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.deleteRows(at: indexPaths, with: animation)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.deleteRows(at: indexPaths, with: animation)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    // MARK: - Moving
    
    open func moveCellController(_ movingCellController: AUITableViewCellController, toSectionControllerBeginning toSectionController: AUITableViewSectionController) {
        guard let fromSectionController = sectionControllers.first(where: { $0.cellControllers.contains(where: { $0 === movingCellController }) }) else { return }
        fromSectionController.cellControllers.removeAll(where: { $0 === movingCellController })
        toSectionController.cellControllers.insert(movingCellController, at: 0)
        reload()
    }
    
    open func moveCellController(_ movingCellController: AUITableViewCellController, toSectionControllerBeginning toSectionController: AUITableViewSectionController, animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            moveCellController(movingCellController, toSectionControllerBeginning: toSectionController)
            return
        }
        guard let fromSectionController = sectionControllers.first(where: { $0.cellControllers.contains(where: { $0 === movingCellController }) }) else { return }
        guard let atIndexPath = indexPathForCellController(movingCellController) else { return }
        fromSectionController.cellControllers.removeAll(where: { $0 === movingCellController })
        toSectionController.cellControllers.insert(movingCellController, at: 0)
        guard let toIndexPath = indexPathForCellController(movingCellController) else { return }
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.moveRow(at: atIndexPath, to: toIndexPath)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.moveRow(at: atIndexPath, to: toIndexPath)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    open func moveCellController(_ movingCellController: AUITableViewCellController, afterCellController: AUITableViewCellController) {
        guard let fromSectionController = sectionControllers.first(where: { $0.cellControllers.contains(where: { $0 === movingCellController }) }) else { return }
        fromSectionController.cellControllers.removeAll(where: { $0 === movingCellController })
        guard let toSectionController = sectionControllers.first(where: { $0.cellControllers.contains(where: { $0 === afterCellController }) }) else { return }
        guard var afterIndex = toSectionController.cellControllers.firstIndex(where: { $0 === afterCellController }) else { return }
        if toSectionController.cellControllers.last === afterCellController {
            toSectionController.cellControllers.append(movingCellController)
        } else {
            afterIndex += 1
            toSectionController.cellControllers.insert(movingCellController, at: afterIndex)
        }
        reload()
    }
    
    open func moveCellController(_ movingCellController: AUITableViewCellController, afterCellController: AUITableViewCellController, animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        guard isTableViewMounted else {
            moveCellController(movingCellController, afterCellController: afterCellController)
            return
        }
        guard let fromSectionController = sectionControllers.first(where: { $0.cellControllers.contains(where: { $0 === movingCellController }) }) else { return }
        guard let atIndexPath = indexPathForCellController(movingCellController) else { return }
        fromSectionController.cellControllers.removeAll(where: { $0 === movingCellController })
        guard let toSectionController = sectionControllers.first(where: { $0.cellControllers.contains(where: { $0 === afterCellController }) }) else { return }
        guard var afterIndex = toSectionController.cellControllers.firstIndex(where: { $0 === afterCellController }) else { return }
        if toSectionController.cellControllers.last === afterCellController {
            toSectionController.cellControllers.append(movingCellController)
        } else {
            afterIndex += 1
            toSectionController.cellControllers.insert(movingCellController, at: afterIndex)
        }
        guard let toIndexPath = indexPathForCellController(movingCellController) else { return }
        if #available(iOS 11.0, *) {
            tableView?.performBatchUpdates({
                self.tableView?.moveRow(at: atIndexPath, to: toIndexPath)
            }, completion: completion)
        } else {
            tableView?.beginUpdates()
            tableView?.moveRow(at: atIndexPath, to: toIndexPath)
            tableView?.endUpdates()
            completion?(true)
        }
    }
    
    // MARK: - IndexPath
    
    private func indexPathForCellController(_ cellController: AUITableViewCellController) -> IndexPath? {
        let enumeratedSectionControllers = sectionControllers.enumerated()
        for (section, sectionController) in enumeratedSectionControllers {
            let cellControllers = sectionController.cellControllers
            let enumeratedCellControllers = cellControllers.enumerated()
            for (row, rowCellController) in enumeratedCellControllers {
                if rowCellController === cellController {
                    let indexPath = IndexPath(row: row, section: section)
                    return indexPath
                }
            }
        }
        return nil
    }
  
    private func indexPathsBySectionsForCellControllers(_ cellControllers: [AUITableViewCellController]) -> [Int: [IndexPath]] {
        var indexPathsBySections: [Int: [IndexPath]] = [:]
        for (section, sectionController) in sectionControllers.enumerated() {
            var indexPaths: [IndexPath] = []
            for (row, cellController) in sectionController.cellControllers.enumerated() {
                if cellControllers.contains(where: { $0 === cellController }) {
                    let indexPath = IndexPath(row: row, section: section)
                    indexPaths.append(indexPath)
                }
            }
            indexPathsBySections[section] = indexPaths
        }
        return indexPathsBySections
    }
    
}

private class UITableViewDelegateProxy: NSObject, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching, UITableViewDragDelegate {
      
    weak var emptyTableViewController: AUIEmptyTableViewController?
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        emptyTableViewController?.scrollViewDidScroll()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        emptyTableViewController?.scrollViewDidEndScrollingAnimation()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        emptyTableViewController?.scrollViewWillBeginDragging()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        emptyTableViewController?.scrollViewDidEndDragging(decelerate: decelerate)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        emptyTableViewController?.scrollViewDidEndDecelerating()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return emptyTableViewController?.numberOfSections() ?? 0
    }
      
    // MARK: Headers
      
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return emptyTableViewController?.headerInSection(section)
    }
      
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return emptyTableViewController?.estimatedHeightForHeaderInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return emptyTableViewController?.heightForHeaderInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        emptyTableViewController?.willDisplayHeaderViewForSection(section)
    }
      
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        emptyTableViewController?.didEndDisplayingHeaderInSection(section)
    }
      
    // MARK: Cells
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emptyTableViewController?.numberOfRowsInSection(section) ?? 0
    }

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        emptyTableViewController?.prefetchRowsAtIndexPaths(indexPaths)
    }
      
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        emptyTableViewController?.cancelPrefetchingForRowsAtIndexPaths(indexPaths)
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return emptyTableViewController?.cellForRowAtIndexPath(indexPath) ?? UITableViewCell()
    }
      
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return emptyTableViewController?.estimatedHeightForCellAtIndexPath(indexPath) ?? 44
    }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return emptyTableViewController?.heightForCellAtIndexPath(indexPath) ?? UITableView.automaticDimension
    }
      
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        emptyTableViewController?.willDisplayCell(cell, atIndexPath: indexPath)
    }
      
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        emptyTableViewController?.didSelectCellAtIndexPath(indexPath)
    }
      
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        emptyTableViewController?.didEndDisplayingCellAtIndexPath(indexPath)
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return emptyTableViewController?.leadingSwipeActionsConfigurationForRowAtIndexPath(indexPath)
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return emptyTableViewController?.trailingSwipeActionsConfigurationForRowAtIndexPath(indexPath)
    }
    
    // MARK: Footers
      
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return emptyTableViewController?.footerInSection(section)
    }
      
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return emptyTableViewController?.estimatedHeightForFooterInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return emptyTableViewController?.heightForFooterInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        emptyTableViewController?.willDisplayFooterViewForSection(section)
    }
      
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        emptyTableViewController?.didEndDisplayingFooterInSection(section)
    }
    
    // MARK: - UITableViewDragDelegate
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return emptyTableViewController?.canMoveRowAtIndexPath(indexPath) ?? false
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return emptyTableViewController?.itemsForBeginning(session: session, at: indexPath) ?? []
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return emptyTableViewController?.targetIndexPathForMoveFromRowAt(sourceIndexPath: sourceIndexPath, toProposedIndexPath: proposedDestinationIndexPath) ?? sourceIndexPath
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        emptyTableViewController?.moveRowAt(sourceIndexPath: sourceIndexPath, to: destinationIndexPath)
    }
    
}
