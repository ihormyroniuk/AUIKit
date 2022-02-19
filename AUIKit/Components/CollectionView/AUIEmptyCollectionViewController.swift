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
        reload()
    }
  
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        collectionViewProxyDelegate.delegate = self
    }
    
    open func reload() {
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
    
    open func willDisplayCellAtIndexPath(_ indexPath: IndexPath) {
        if let cellController = deletedIndexPaths[indexPath] {
            cellController.willDisplayCell()
            return
        }
        let section = indexPath.section
        let index = indexPath.item
        sectionControllers[section].willDisplayCellAtIndex(index)
    }
    
    open func didEndDisplayingCellAtIndexPath(_ indexPath: IndexPath) {
        if let cellController = deletedIndexPaths[indexPath] {
            deletedIndexPaths[indexPath] = nil
            cellController.didEndDisplayingCell()
            return
        }
        let section = indexPath.section
        let index = indexPath.item
        sectionControllers[section].didEndDisplayingCellAtIndex(index)
    }
    
    open func didSelectCellAtIndexPath(_ indexPath: IndexPath) {
        let section = indexPath.section
        let index = indexPath.item
        sectionControllers[section].didSelectCellAtIndex(index)
    }
    
    func canMoveItemAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return false
    }
    
    // MARK:
    
    open func deleteCellController(_ cellController: AUICollectionViewCellController) {
        deleteCellControllers([cellController])
    }
    
    open func deleteCellControllers(_ cellControllers: [AUICollectionViewCellController]) {
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        for (section, indexPaths) in indexPathsBySections {
            let rows = indexPaths.map({ $0.row })
            sectionControllers[section].cellControllers = sectionControllers[section].cellControllers.enumerated().filter({ !rows.contains($0.offset) }).map({ $0.element })
        }
        reload()
    }
  
    open var deletedIndexPaths: [IndexPath: AUICollectionViewCellController] = [:]
    open func deleteCellControllersAnimated(_ cellControllers: [AUICollectionViewCellController], completion: ((Bool) -> Void)?) {
        let indexPathsBySections = indexPathsBySectionsForCellControllers(cellControllers)
        let indexPaths = indexPathsBySections.reduce([]) { $1.value }
        for indexPath in indexPaths {
            let section = indexPath.section
            let sectionController = sectionControllers[section]
            let item = indexPath.item
            let cellController = sectionController.cellControllers[item]
            deletedIndexPaths[indexPath] = cellController
        }
        for (section, indexPaths) in indexPathsBySections {
            let rows = indexPaths.map({ $0.row })
            sectionControllers[section].cellControllers = sectionControllers[section].cellControllers.enumerated().filter({ !rows.contains($0.offset) }).map({ $0.element })
        }
        collectionView?.performBatchUpdates({
            self.collectionView?.deleteItems(at: indexPaths)
        }, completion: completion)
    }
    
    open func deleteCellControllerAnimated(_ cellController: AUICollectionViewCellController, completion: ((Bool) -> Void)?) {
        deleteCellControllersAnimated([cellController], completion: completion)
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
    
    open func indexPathForCellController(_ cellController: AUICollectionViewCellController) -> IndexPath? {
        let gg = indexPathsBySectionsForCellControllers([cellController])
        return gg.values.first?.first
    }
    
    open func cellControllerForIndexPath(_ indexPath: IndexPath) -> AUICollectionViewCellController {
        return sectionControllers[indexPath.section].cellControllers[indexPath.item]
    }
    
}

private class UICollectionViewProxyDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDataSourcePrefetching, UICollectionViewDelegateFlowLayout {
      
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
        delegate?.willDisplayCellAtIndexPath(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        delegate?.didEndDisplayingCellAtIndexPath(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCellAtIndexPath(indexPath)
    }
    
}
