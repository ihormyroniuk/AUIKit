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
        deletedIndexPaths[indexPath] = nil
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
    
    open func sizeForCellAtIndexPath(_ indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        let index = indexPath.item
        return sectionControllers[section].sizeForCellAtIndex(index)
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
    
    // MARK: - Inserting
    
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
            let indexPaths = indexPathsForCellControllers(deletingCellControllers).sorted(by: >)
            for indexPath in indexPaths {
                let section = indexPath.section
                let sectionController = sectionControllers[section]
                let item = indexPath.item
                let cellController = sectionController.cellControllers[item]
                sectionController.cellControllers.remove(at: item)
                deletedIndexPaths[indexPath] = cellController
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
        let indexPaths = indexPathsForCellControllers(deletingCellControllers).sorted(by: >)
        for indexPath in indexPaths {
            let section = indexPath.section
            let sectionController = sectionControllers[section]
            let item = indexPath.item
            let cellController = sectionController.cellControllers[item]
            sectionController.cellControllers.remove(at: item)
            deletedIndexPaths[indexPath] = cellController
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
        return delegate?.sizeForCellAtIndexPath(indexPath) ?? .zero
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
