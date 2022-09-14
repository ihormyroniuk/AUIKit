import UIKit

open class AUIEmptyTableViewController: AUIEmptyScrollViewController, AUITableViewController {
    
    // MARK: Proxy
  
    private let tableViewDelegateProxy = UITableViewDelegateProxy()
    
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        tableViewDelegateProxy.delegate = self
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
    }
    
    // MARK: Drag Interaction
    
    open var dragInteractionEnabled: Bool = false {
        didSet { didSetDragInteractionEnabled(oldValue) }
    }
    open func didSetDragInteractionEnabled(_ oldValue: Bool) {
        if #available(iOS 11.0, *) {
            tableView?.dragInteractionEnabled = dragInteractionEnabled
        }
    }
    
    // MARK: Prefetching
    
    open var isPrefetchingEnabled: Bool = true {
        didSet { didSetIsPrefetchingEnabled(oldValue) }
    }
    open func didSetIsPrefetchingEnabled(_ oldValue: Bool) {
        if #available(iOS 11.0, *) {
            if #available(iOS 15.0, *) {
                tableView?.isPrefetchingEnabled = isPrefetchingEnabled
            }
        }
    }
  
    // MARK: Sections
  
    open var sectionControllers: [AUITableViewSectionController] = [] {
        didSet { didSetSectionControllers(oldValue) }
    }
    open func didSetSectionControllers(_ oldValue: [AUITableViewSectionController]) {
        
    }
  
    open func numberOfSections() -> Int {
        let numberOfSections = sectionControllers.count
        return numberOfSections
    }
  
    // MARK: Headers
  
    open func headerInSection(_ section: Int) -> UIView? {
        let sectionController = sectionControllers[section]
        guard let headerController = sectionController.headerController else { return nil }
        guard let tableView = tableView else { return UITableViewCell() }
        let headerType = headerController.headerFooterType
        let headerIdentifier = headerController.headerFooterIdentifier
        tableView.register(headerType, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier)
        headerController.headerFooter = header
        return header
    }
  
    open func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat {
        let sectionController = sectionControllers[section]
        let headerController = sectionController.headerController
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        guard let estimatedHeight = headerController?.headerFooterEstimatedHeight(width) else { return .zero }
        return estimatedHeight
    }
  
    open func heightForHeaderInSection(_ section: Int) -> CGFloat {
        let sectionController = sectionControllers[section]
        let headerController = sectionController.headerController
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        guard let height = headerController?.headerFooterHeight(width) else { return .zero }
        return height
    }
  
    open func willDisplayHeaderViewForSection(_ section: Int) {
        let sectionController = sectionControllers[section]
        let headerController = sectionController.headerController
        headerController?.willDisplayHeaderFooter()
    }
  
    open func didEndDisplayingHeaderInSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        let sectionController = sectionControllers[section]
        let headerController = sectionController.headerController
        headerController?.didEndDisplayingHeaderFooter()
    }
  
    // MARK: Cells
    
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
        cellController.cell = cell
        return cell
    }
  
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
        if cellController.cell != cell {
            cellController.cell = cell
        }
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
        let cellController = sectionController.cellControllers[row]
        cellController.cell = nil
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
    
    // MARK: Footers
  
    open func footerInSection(_ section: Int) -> UIView? {
        let sectionController = sectionControllers[section]
        guard let footerController = sectionController.footerController else { return nil }
        guard let tableView = tableView else { return UITableViewCell() }
        let footerType = footerController.headerFooterType
        let footerIdentifier = footerController.headerFooterIdentifier
        tableView.register(footerType, forHeaderFooterViewReuseIdentifier: footerIdentifier)
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerIdentifier)
        footerController.headerFooter = footer
        return footer
    }
  
    open func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat {
        let sectionController = sectionControllers[section]
        let footerController = sectionController.footerController
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        guard let estimatedHeight = footerController?.headerFooterEstimatedHeight(width) else { return 0 }
        return estimatedHeight
    }
  
    open func heightForFooterInSection(_ section: Int) -> CGFloat {
        let sectionController = sectionControllers[section]
        let footerController = sectionController.footerController
        guard let tableView = tableView else { return .zero }
        let width = tableView.bounds.width
        guard let height = footerController?.headerFooterHeight(width) else { return 0 }
        return height
    }
  
    open func willDisplayFooterViewForSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        let sectionController = sectionControllers[section]
        let footerController = sectionController.footerController
        footerController?.willDisplayHeaderFooter()
    }
  
    open func didEndDisplayingFooterInSection(_ section: Int) {
        guard section < sectionControllers.count else { return }
        let sectionController = sectionControllers[section]
        let footerController = sectionController.footerController
        footerController?.didEndDisplayingHeaderFooter()
    }
    
    // MARK: Reload
  
    open func reload() {
        deletedIndexPaths = tableView?.indexPathsForVisibleRows ?? []
        tableView?.reloadData()
    }
  
    open func deleteCellControllers(_ cellControllers: [AUITableViewCellController]) {
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        for (section, indexPaths) in indexPathsBySections {
            let rows = indexPaths.map({ $0.row })
            sectionControllers[section].cellControllers = sectionControllers[section].cellControllers.enumerated().filter({ !rows.contains($0.offset) }).map({ $0.element })
        }
        reload()
    }
    open func deleteCellController(_ cellController: AUITableViewCellController) {
        deleteCellControllers([cellController])
    }
  
    open var deletedIndexPaths: [IndexPath] = []
    open func deleteCellControllersAnimated(_ cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
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
    open func deleteCellControllerAnimated(_ cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        deleteCellControllersAnimated([cellController], animation, completion: completion)
    }
  
    open func insertCellControllerAtSectionEnd(_ section: AUITableViewSectionController, cellController: AUITableViewCellController) {
        section.cellControllers.append(cellController)
        reload()
    }
    
    open func insertSectionAtBeginning(_ sectionController: AUITableViewSectionController) {
        sectionControllers.insert(sectionController, at: 0)
        reload()
    }
    
    open func insertSectionAtBeginningAnimated(_ sectionController: AUITableViewSectionController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
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
    
    open func insertCellControllerAtSectionEndAnimated(_ section: AUITableViewSectionController, cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
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
  
    open func insertCellControllerAtSectionBeginning(_ section: AUITableViewSectionController, cellController: AUITableViewCellController) {
        if section.cellControllers.isEmpty {
            section.cellControllers.append(cellController)
        } else {
            section.cellControllers.insert(cellController, at: 0)
        }
        reload()
    }
    
    open func insertCellControllerAtSectionBeginningAnimated(_ section: AUITableViewSectionController, cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?) {
        if section.cellControllers.isEmpty {
            section.cellControllers.append(cellController)
        } else {
            section.cellControllers.insert(cellController, at: 0)
        }
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
  
    public func insertCellControllers(_ cellControllers: [AUITableViewCellController], afterCellController cellController: AUITableViewCellController, inSection section: AUITableViewSectionController) {
        guard let index = section.cellControllers.firstIndex(where: { $0 === cellController }) else { return }
        section.cellControllers.insert(contentsOf: cellControllers, at: index + 1)
        reload()
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

class UITableViewDelegateProxy: AUIScrollViewDelegateProxy, UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching, UITableViewDragDelegate {
      
    weak var delegate: AUIEmptyTableViewController?
      
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.numberOfSections() ?? 0
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScrollClosure?()
    }
    
    override func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidEndScrollingAnimationClosure?()
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegate?.scrollViewWillBeginDraggingClosure?()
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegate?.scrollViewDidEndDraggingClosure?(decelerate)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidEndDeceleratingClosure?()
    }
      
    // MARK: Headers
      
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return delegate?.headerInSection(section)
    }
      
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.estimatedHeightForHeaderInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return delegate?.heightForHeaderInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        delegate?.willDisplayHeaderViewForSection(section)
    }
      
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        delegate?.didEndDisplayingHeaderInSection(section)
    }
      
    // MARK: Cells
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberOfRowsInSection(section) ?? 0
    }

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        delegate?.prefetchRowsAtIndexPaths(indexPaths)
    }
      
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        delegate?.cancelPrefetchingForRowsAtIndexPaths(indexPaths)
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return delegate?.cellForRowAtIndexPath(indexPath) ?? UITableViewCell()
    }
      
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.estimatedHeightForCellAtIndexPath(indexPath) ?? 44
    }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegate?.heightForCellAtIndexPath(indexPath) ?? UITableView.automaticDimension
    }
      
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.willDisplayCell(cell, atIndexPath: indexPath)
    }
      
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectCellAtIndexPath(indexPath)
    }
      
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.didEndDisplayingCellAtIndexPath(indexPath)
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return delegate?.leadingSwipeActionsConfigurationForRowAtIndexPath(indexPath)
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return delegate?.trailingSwipeActionsConfigurationForRowAtIndexPath(indexPath)
    }
    
    // MARK: Footers
      
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return delegate?.footerInSection(section)
    }
      
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return delegate?.estimatedHeightForFooterInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return delegate?.heightForFooterInSection(section) ?? 0
    }
      
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        delegate?.willDisplayFooterViewForSection(section)
    }
      
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        delegate?.didEndDisplayingFooterInSection(section)
    }
    
    // MARK: - Drag and Drop Interaction
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return delegate?.canMoveRowAtIndexPath(indexPath) ?? false
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return delegate?.itemsForBeginning(session: session, at: indexPath) ?? []
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return delegate?.targetIndexPathForMoveFromRowAt(sourceIndexPath: sourceIndexPath, toProposedIndexPath: proposedDestinationIndexPath) ?? sourceIndexPath
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        delegate?.moveRowAt(sourceIndexPath: sourceIndexPath, to: destinationIndexPath)
    }
    
}
