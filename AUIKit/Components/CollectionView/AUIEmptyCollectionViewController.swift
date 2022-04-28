//
//  AUIEmptyCollectionViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

open class AUIEmptyCollectionViewController: AUIEmptyScrollViewController, AUICollectionViewController {
    
    // MARK: UICollectionView
  
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
    }
    
    // MARK: Prefetching
    
    open var isPrefetchingEnabled: Bool = true {
        didSet { didSetIsPrefetchingEnabled(oldValue) }
    }
    open func didSetIsPrefetchingEnabled(_ oldValue: Bool) {
        collectionView?.isPrefetchingEnabled = isPrefetchingEnabled
    }
    
    // MARK: Proxy Delegate
  
    private let collectionViewProxyDelegate = UICollectionViewProxyDelegate()
  
    // MARK: Controllers
  
    open var sectionControllers: [AUICollectionViewSectionController] = [] {
        didSet {
            didSetSectionControllers(oldValue)
        }
    }
    open func didSetSectionControllers(_ oldValue: [AUICollectionViewSectionController]) {
        
    }
  
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        collectionViewProxyDelegate.delegate = self
    }
    
    open func reload() {
        let indexPaths = collectionView?.indexPathsForVisibleItems ?? []
        self.deletedIndexPaths = indexPaths.reduce(into: [IndexPath: AUICollectionViewCellController](), {
            $0[$1] = cellControllerForIndexPath($1)
        })
        collectionView?.reloadData()
    }
    
    // MARK: Sections
    
    open func numberOfSections() -> Int {
        return sectionControllers.count
    }
    
    // MARK: Cells
    
    open func numberOfItemsInSection(_ section: Int) -> Int {
        return sectionControllers[section].numberOfItems
    }
    
    open func prefetchItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if let cellController = deletedIndexPaths[indexPath] {
                cellController.prefetchCell()
                return
            }
            let section = indexPath.section
            let index = indexPath.item
            sectionControllers[section].prefetchCellAtIndex(index)
        }
    }
    
    open func cancelPrefetchingForItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if let cellController = deletedIndexPaths[indexPath] {
                cellController.cancelPrefetchingForCell()
                return
            }
            let section = indexPath.section
            let index = indexPath.item
            sectionControllers[section].cancelPrefetchingForCellAtIndex(index)
        }
    }
    
    open func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        deletedIndexPaths[indexPath] = nil
        let section = indexPath.section
        return sectionControllers[section].cellForItemAtIndexPath(indexPath)
    }
    
    open func sizeForCellAtIndexPath(_ indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        let index = indexPath.item
        return sectionControllers[section].sizeForCellAtIndex(index)
    }
    
    open func willDisplayCell(_ cell: UICollectionViewCell, atIndexPath indexPath: IndexPath) {
        if let cellController = deletedIndexPaths[indexPath] {
            cellController.willDisplayCell(cell)
            return
        }
        let section = indexPath.section
        let index = indexPath.item
        sectionControllers[section].willDisplayCell(cell, atIndex: index)
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
        let index = indexPath.item
        sectionControllers[section].didEndDisplayingCellAtIndex(index)
    }
    
    open func shouldSelectItemAtIndexPath(_ indexPath: IndexPath) -> Bool {
        let section = indexPath.section
        let index = indexPath.item
        return sectionControllers[section].shouldSelectItemAtIndex(index)
    }
    
    open func didSelectCellAtIndexPath(_ indexPath: IndexPath) {
        let section = indexPath.section
        let index = indexPath.item
        sectionControllers[section].didSelectCellAtIndex(index)
    }
    
    // MARK: Modification
    
    open var deletedIndexPaths: [IndexPath: AUICollectionViewCellController] = [:]
    
    open func deleteCellControllers(_ cellControllers: [AUICollectionViewCellController], completion: ((Bool) -> Void)?) {
        collectionView?.performBatchUpdates({ [weak self] in
            guard let self = self else { return }
            let indexPaths = indexPathsForCellControllers(cellControllers)
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
    
    open func deleteCellController(_ cellController: AUICollectionViewCellController, completion: ((Bool) -> Void)?) {
        deleteCellControllers([cellController], completion: completion)
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
    
    open var movedIndexPath: IndexPath?
    
    open func moveItem(at atIndexPath: IndexPath, to toIndexPath: IndexPath, completion: ((Bool) -> Void)?) {
        collectionView?.performBatchUpdates({ [weak self] in
            guard let self = self else { return }
            self.collectionView?.moveItem(at: atIndexPath, to: toIndexPath)
        }, completion: { finished in
            completion?(finished)
        })
    }
    
    // MARK: IndexPath
    
    open func indexPathForCellController(_ cellController: AUICollectionViewCellController) -> IndexPath? {
        for (section, sectionController) in sectionControllers.enumerated() {
            for (item, _cellController) in sectionController.cellControllers.enumerated() {
                if _cellController === cellController {
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
    
    open func cellControllerForIndexPath(_ indexPath: IndexPath) -> AUICollectionViewCellController {
        return sectionControllers[indexPath.section].cellControllers[indexPath.item]
    }
    
    // MARK: Relaod
    
    open func deleteCellControllerReload(_ cellController: AUICollectionViewCellController) {
        deleteCellControllersReload([cellController])
    }
    
    open func deleteCellControllersReload(_ cellControllers: [AUICollectionViewCellController]) {
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        for (section, indexPaths) in indexPathsBySections {
            let rows = indexPaths.map({ $0.row })
            sectionControllers[section].cellControllers = sectionControllers[section].cellControllers.enumerated().filter({ !rows.contains($0.offset) }).map({ $0.element })
        }
        reload()
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

private class UICollectionViewProxyDelegate: AUIEmptyScrollViewDelegateProxy, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDataSourcePrefetching, UICollectionViewDelegateFlowLayout {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScrollClosure?()
    }
    
    override func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidEndScrollingAnimationClosure?()
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegate?.scrollViewDidEndDraggingClosure?()
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidEndDeceleratingClosure?()
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
