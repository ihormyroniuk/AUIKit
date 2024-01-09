import UIKit

open class AUIEmptyCollectionViewController: AUIEmptyScrollViewController, AUICollectionViewController {
    
    // MARK: - Setup
  
    open override func setup() {
        super.setup()
        collectionViewProxyDelegate.delegate = self
    }
    
    // MARK: - UICollectionView
  
    open var collectionView: UICollectionView? {
        set { view = newValue }
        get { return view as? UICollectionView }
    }
    
    open override func setupScrollView() {
        super.setupScrollView()
        setupCollectionView()
    }
    
    open func setupCollectionView() {
        collectionView?.dataSource = collectionViewProxyDelegate
        collectionView?.delegate = collectionViewProxyDelegate
        collectionView?.prefetchDataSource = collectionViewProxyDelegate
        collectionView?.isPrefetchingEnabled = isPrefetchingEnabled
        collectionView?.reloadData()
    }
    
    open override func unsetupScrollView() {
        super.unsetupScrollView()
        unsetupCollectionView()
    }
    
    open func unsetupCollectionView() {
        collectionView?.dataSource = nil
        collectionView?.delegate = nil
        collectionView?.prefetchDataSource = nil
        collectionView?.isPrefetchingEnabled = isPrefetchingEnabled
        collectionView?.reloadData()
        cells = [:]
    }
    
    // MARK: - Prefetching
    
    open var isPrefetchingEnabled: Bool = true {
        didSet { didSetIsPrefetchingEnabled(oldValue) }
    }
    open func didSetIsPrefetchingEnabled(_ oldValue: Bool) {
        collectionView?.isPrefetchingEnabled = isPrefetchingEnabled
    }
    
    // MARK: - UICollectionViewProxyDelegate
  
    private let collectionViewProxyDelegate = UICollectionViewProxyDelegate()
    
    open var sectionControllers: [AUICollectionViewSectionController] = [] {
        didSet {
            didSetSectionControllers(oldValue)
        }
    }
    open func didSetSectionControllers(_ oldValue: [AUICollectionViewSectionController]) {
        
    }
    
    open func reload() {
        let indexPaths = collectionView?.indexPathsForVisibleItems ?? []
        self.deletedIndexPaths = indexPaths.reduce(into: [IndexPath: AUICollectionViewCellController](), {
            $0[$1] = cellControllerForIndexPath($1)
        })
        collectionView?.reloadData()
    }
        
    open func numberOfSections() -> Int {
        let numberOfSections = sectionControllers.count
        return numberOfSections
    }
        
    open func numberOfItemsInSection(_ section: Int) -> Int {
        let sectionController = sectionControllers[section]
        let cellControllers = sectionController.cellControllers
        let numberOfItems = cellControllers.count
        return numberOfItems
    }
    
    open func prefetchItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let section = indexPath.section
            let sectionController = sectionControllers[section]
            let row = indexPath.row
            let cellController = sectionController.cellControllers[row]
            cellController.prefetchCell()
        }
    }
    
    open func cancelPrefetchingForItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let section = indexPath.section
            let sectionController = sectionControllers[section]
            let row = indexPath.row
            guard row < sectionController.cellControllers.count else { return }
            let cellController = sectionController.cellControllers[row]
            cellController.cancelPrefetchingForCell()
        }
    }
    
    open func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        deletedIndexPaths = [:]
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        guard let collectionView = collectionView else { return UICollectionViewCell() }
        let cellType = cellController.cellType
        let cellIdentifier = cellController.cellIdentifier
        collectionView.register(cellType, forCellWithReuseIdentifier: cellIdentifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
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
    
    private var cells: [UICollectionViewCell: AUICollectionViewCellController] = [:]
    
    open func sizeForCellAtIndexPath(_ indexPath: IndexPath, size: CGSize) -> CGSize {
        let section = indexPath.section
        let index = indexPath.item
        return sectionControllers[section].sizeForCellAtIndex(index, size: size)
    }
    
    open func willDisplayCell(_ cell: UICollectionViewCell, atIndexPath indexPath: IndexPath) {
        if let cellController = deletedIndexPaths[indexPath] {
            cellController.willDisplayCell()
            return
        }
        deletedIndexPaths[indexPath] = nil
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let row = indexPath.row
        let cellController = sectionController.cellControllers[row]
        return cellController.willDisplayCell()
    }
    
    open func didEndDisplayingCellAtIndexPath(_ indexPath: IndexPath) {
        if movedIndexPath == indexPath {
            movedIndexPath = nil
            return
        }
        if let cellController = deletedIndexPaths[indexPath] {
            deletedIndexPaths[indexPath] = nil
            cellController.didEndDisplayingCell()
            return
        }
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let index = indexPath.item
        guard index < sectionController.cellControllers.count else { return }
        let cellController = sectionController.cellControllers[index]
        cellController.didEndDisplayingCell()
    }
    
    open func shouldSelectItemAtIndexPath(_ indexPath: IndexPath) -> Bool {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let item = indexPath.item
        let cellController = sectionController.cellControllers[item]
        let shouldSelectCell = cellController.shouldSelectCell
        return shouldSelectCell
    }
    
    open func didSelectCellAtIndexPath(_ indexPath: IndexPath) {
        let section = indexPath.section
        let sectionController = sectionControllers[section]
        let item = indexPath.item
        let cellController = sectionController.cellControllers[item]
        cellController.didSelectCell()
    }
    
    // MARK: - Scrolling
    
    open func scrollToCellController(_ cellController: AUICollectionViewCellController, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
        guard let indexPath = indexPathForCellController(cellController) else { return }
        guard let collectionView = collectionView else { return }
        collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    // MARK: - Reloading
    
    open func reloadSection(_ sectionController: AUICollectionViewSectionController, cellControllers: [AUICollectionViewCellController]) {
        sectionController.cellControllers = cellControllers
        reload()
    }
    
    open func reloadSectionAnimated(_ sectionController: AUICollectionViewSectionController, cellControllers: [AUICollectionViewCellController], completion: ((Bool) -> Void)?) {
        guard let section = sectionControllers.firstIndex(where: { $0 === sectionController }) else {
            completion?(true)
            return
        }
        let sections = IndexSet([section])
        guard let collectionView = collectionView else {
            completion?(true)
            return
        }
        sectionController.cellControllers = cellControllers
        collectionView.performBatchUpdates({
            self.collectionView?.reloadSections(sections)
        }, completion: completion)
    }
    
    open func reloadCellController(_ cellController: AUICollectionViewCellController) {
        guard let collectionView = collectionView else { return }
        collectionView.reloadData()
    }
    
    open func reloadCellControllerAnimated(_ cellController: AUICollectionViewCellController, completion: ((Bool) -> Void)?) {
        guard let indexPath = indexPathForCellController(cellController) else {
            completion?(true)
            return
        }
        guard let collectionView = collectionView else {
            completion?(true)
            return
        }
        let indexPaths = [indexPath]
        collectionView.performBatchUpdates({
            self.collectionView?.reloadItems(at: indexPaths)
        }, completion: completion)
    }
    
    // MARK: - Inserting
    
    open func insertSectionAtBeginning(_ insertingSectionController: AUICollectionViewSectionController) {
        insertSectionsAtBeginning([insertingSectionController])
    }
    
    open func insertSectionAtBeginningAnimated(_ insertingSectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?) {
        insertSectionsAtBeginningAnimated([insertingSectionController], completion: completion)
    }
    
    open func insertSectionsAtBeginning(_ insertingSectionControllers: [AUICollectionViewSectionController]) {
        sectionControllers.insert(contentsOf: insertingSectionControllers, at: 0)
        guard let collectionView = collectionView else { return }
        collectionView.reloadData()
    }
    
    open func insertSectionsAtBeginningAnimated(_ insertingSectionControllers: [AUICollectionViewSectionController], completion: ((Bool) -> Void)?) {
        sectionControllers.insert(contentsOf: insertingSectionControllers, at: 0)
        guard let collectionView = collectionView else {
            completion?(true)
            return
        }
        collectionView.performBatchUpdates({ 
            let insertingSectionControllersCount = insertingSectionControllers.count
            let sections = IndexSet(Array(0..<insertingSectionControllersCount))
            collectionView.insertSections(sections)
        }, completion: { finished in
            completion?(finished)
        })
    }
    
    open func appendSectionControllers(_ sectionControllers: [AUICollectionViewSectionController], completion: ((Bool) -> Void)?) {
        collectionView?.performBatchUpdates({ [weak self] in
            guard let self = self else { return }
            let sectionControllersCount = self.sectionControllers.count
            let appendedSectionControllersCount = sectionControllersCount + sectionControllers.count
            let sections: IndexSet = IndexSet(Array(sectionControllersCount..<appendedSectionControllersCount))
            self.sectionControllers.append(contentsOf: sectionControllers)
            self.collectionView?.insertSections(sections)
        }, completion: { finished in
            completion?(finished)
        })
    }
    
    open func appendSectionController(_ sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?) {
        appendSectionControllers([sectionController], completion: completion)
    }
    
    open func appendCellControllers(_ cellControllers: [AUICollectionViewCellController], toSectionController sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?) {
        collectionView?.performBatchUpdates({ [weak self] in
            guard let self = self else { return }
            guard let section = sectionControllers.firstIndex(where: { $0 === sectionController }) else { return }
            let cellControllersCount = sectionController.cellControllers.count
            let appendedCellControllersCount = cellControllersCount + cellControllers.count
            let indexPaths: [IndexPath] = Array(cellControllersCount..<appendedCellControllersCount).map({ IndexPath(item: $0, section: section) })
            sectionController.cellControllers.append(contentsOf: cellControllers)
            self.collectionView?.insertItems(at: indexPaths)
        }, completion: { finished in
            completion?(finished)
        })
    }
    
    open func appendCellController(_ cellController: AUICollectionViewCellController, toSectionController sectionController: AUICollectionViewSectionController, completion: ((Bool) -> Void)?) {
        appendCellControllers([cellController], toSectionController: sectionController, completion: completion)
    }
    
    open func insertCellController(_ insertingCellController: AUICollectionViewCellController, afterCellController cellController: AUICollectionViewCellController, inSection section: AUICollectionViewSectionController) {
        insertCellControllers([insertingCellController], afterCellController: cellController, inSection: section)
    }
    
    open func insertCellControllers(_ insertingCellControllers: [AUICollectionViewCellController], afterCellController cellController: AUICollectionViewCellController, inSection section: AUICollectionViewSectionController) {
        guard let index = section.cellControllers.firstIndex(where: { $0 === cellController }) else { return }
        section.cellControllers.insert(contentsOf: insertingCellControllers, at: index + 1)
        collectionView?.reloadData()
    }
    
    open func insertCellControllerAnimated(_ insertingCellController: AUICollectionViewCellController, afterCellController cellController: AUICollectionViewCellController, inSection section: AUICollectionViewSectionController, completion: ((Bool) -> Void)?) {
        insertCellControllersAnimated([insertingCellController], afterCellController: cellController, inSection: section, completion: completion)
    }
    
    open func insertCellControllersAnimated(_ insertingCellControllers: [AUICollectionViewCellController], afterCellController cellController: AUICollectionViewCellController, inSection section: AUICollectionViewSectionController, completion: ((Bool) -> Void)?) {
        guard let index = section.cellControllers.firstIndex(where: { $0 === cellController }) else { return }
        section.cellControllers.insert(contentsOf: insertingCellControllers, at: index + 1)
        let indexPathsBySections = indexPathsBySectionsForCellControllers(insertingCellControllers)
        let indexPaths = indexPathsBySections.values.reduce([], +)
        collectionView?.performBatchUpdates({
            self.collectionView?.insertItems(at: indexPaths)
        }, completion: { success in
            completion?(success)
        })
    }
    
    // MARK: - Moving
    
    open var movedIndexPath: IndexPath?
    
    open func moveItem(at atIndexPath: IndexPath, to toIndexPath: IndexPath, completion: ((Bool) -> Void)?) {
        collectionView?.performBatchUpdates({ [weak self] in
            guard let self = self else { return }
            self.collectionView?.moveItem(at: atIndexPath, to: toIndexPath)
        }, completion: { finished in
            completion?(finished)
        })
    }
    
    // MARK: - Deleting
    
    open var deletedIndexPaths: [IndexPath: AUICollectionViewCellController] = [:]
    
    open func deleteCellControllersAnimated(_ deletingCellControllers: [AUICollectionViewCellController], completion: ((Bool) -> Void)?) {
        collectionView?.performBatchUpdates({ [weak self] in
            guard let self = self else { return }
            deletedIndexPaths = indexPathsCellControllers
            let indexPaths = indexPathsForCellControllers(deletingCellControllers).sorted(by: >)
            for indexPath in indexPaths {
                let section = indexPath.section
                let sectionController = sectionControllers[section]
                let item = indexPath.item
                let cellController = sectionController.cellControllers[item]
                sectionController.cellControllers.remove(at: item)
            }
            self.collectionView?.deleteItems(at: indexPaths)
        }, completion: { finished in
            completion?(finished)
        })
    }
    
    open func deleteCellControllerAnimated(_ cellController: AUICollectionViewCellController, completion: ((Bool) -> Void)?) {
        deleteCellControllersAnimated([cellController], completion: completion)
    }
    
    open func deleteCellController(_ cellController: AUICollectionViewCellController) {
        deleteCellControllers([cellController])
    }
    
    open func deleteCellControllers(_ deletingCellControllers: [AUICollectionViewCellController]) {
        deletedIndexPaths = indexPathsCellControllers
        let indexPaths = indexPathsForCellControllers(deletingCellControllers).sorted(by: >)
        for indexPath in indexPaths {
            let section = indexPath.section
            let sectionController = sectionControllers[section]
            let item = indexPath.item
            let cellController = sectionController.cellControllers[item]
            sectionController.cellControllers.remove(at: item)
        }
        self.collectionView?.reloadData()
    }
    
    // MARK: - IndexPath
    
    open func indexPathForCellController(_ cellController: AUICollectionViewCellController) -> IndexPath? {
        for (section, sectionController) in sectionControllers.enumerated() {
            for (item, itemCellController) in sectionController.cellControllers.enumerated() {
                if itemCellController === cellController {
                    let indexPath = IndexPath(item: item, section: section)
                    return indexPath
                }
            }
        }
        return nil
    }
    
    open func indexPathsForCellControllers(_ cellControllers: [AUICollectionViewCellController]) -> [IndexPath] {
        var indexPaths: [IndexPath] = []
        for (section, sectionController) in sectionControllers.enumerated() {
            for (item, cellController) in sectionController.cellControllers.enumerated() {
                if cellControllers.contains(where: { $0 === cellController }) {
                    let indexPath = IndexPath(item: item, section: section)
                    indexPaths.append(indexPath)
                }
            }
        }
        return indexPaths
    }
    
    open func cellControllerForIndexPath(_ indexPath: IndexPath) -> AUICollectionViewCellController? {
        guard indexPath.section < sectionControllers.count else { return nil }
        let sectionController = sectionControllers[indexPath.section]
        guard indexPath.item < sectionController.cellControllers.count else { return nil }
        let cellController = sectionController.cellControllers[indexPath.item]
        return cellController
    }
    
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
    
    private func indexPathsBySectionsForCellControllers(_ cellControllers: [AUICollectionViewCellController]) -> [Int: [IndexPath]] {
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
    
    private var indexPathsCellControllers: [IndexPath: AUICollectionViewCellController] {
        var indexPathsCellControllers: [IndexPath: AUICollectionViewCellController] = [:]
        for (section, sectionController) in sectionControllers.enumerated() {
            for (item, cellController) in sectionController.cellControllers.enumerated() {
                let indexPath = IndexPath(item: item, section: section)
                indexPathsCellControllers[indexPath] = cellController
            }
        }
        return indexPathsCellControllers
    }
        
}

private class UICollectionViewProxyDelegate: NSObject, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDataSourcePrefetching, UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScroll()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidEndScrollingAnimation()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegate?.scrollViewDidEndDragging(decelerate: decelerate)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidEndDecelerating()
    }
      
    weak var delegate: AUIEmptyCollectionViewController?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate?.numberOfSections() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.numberOfItemsInSection(section) ?? 0
    }
    
    // MARK: Cells
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        delegate?.prefetchItemsAtIndexPaths(indexPaths)
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        delegate?.cancelPrefetchingForItemsAtIndexPaths(indexPaths)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return delegate?.cellForItemAtIndexPath(indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(
            width: collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right,
            height: collectionView.bounds.height - collectionView.contentInset.top - collectionView.contentInset.bottom
        )
        return delegate?.sizeForCellAtIndexPath(indexPath, size: size) ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        delegate?.willDisplayCell(cell, atIndexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        delegate?.didEndDisplayingCellAtIndexPath(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCellAtIndexPath(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return delegate?.shouldSelectItemAtIndexPath(indexPath) ?? false
    }
    
}
