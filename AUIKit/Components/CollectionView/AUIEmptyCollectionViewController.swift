//
//  AUIEmptyCollectionViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

open class AUIEmptyCollectionViewController: AUIEmptyScrollViewController, AUICollectionViewController {
    
    // MARK: View
  
    open var collectionView: UICollectionView? {
        set { view = newValue }
        get { return view as? UICollectionView }
    }
  
    open override func setupView() {
        super.setupView()
        collectionView?.dataSource = collectionViewProxyDelegate
        collectionView?.delegate = collectionViewProxyDelegate
        collectionView?.prefetchDataSource = collectionViewProxyDelegate
        collectionView?.reloadData()
    }

    open override func unsetupView() {
        super.unsetupView()
        collectionView?.dataSource = nil
        collectionView?.delegate = nil
        collectionView?.prefetchDataSource = nil
    }
    
    // MARK: Delegates
  
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
    
    open func numberOfSections() -> Int {
        return sectionControllers.count
    }
    
    open func numberOfItemsInSection(_ section: Int) -> Int {
        return sectionControllers[section].numberOfItems
    }
    
    open func prefetchItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let section = indexPath.section
            let index = indexPath.item
            sectionControllers[section].prefetchCellAtIndex(index)
        }
    }
    
    open func cancelPrefetchingForItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let section = indexPath.section
            let index = indexPath.item
            sectionControllers[section].cancelPrefetchingForCellAtIndex(index)
        }
    }
    
    open func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        return sectionControllers[section].cellForItemAtIndexPath(indexPath)
    }
    
    open func willDisplayCellAtIndexPath(_ indexPath: IndexPath) {
        let section = indexPath.section
        let index = indexPath.item
        sectionControllers[section].willDisplayCellAtIndex(index)
    }
    
    open func didEndDisplayingCellAtIndexPath(_ indexPath: IndexPath) {
        let section = indexPath.section
        let index = indexPath.item
        sectionControllers[section].cancelPrefetchingForCellAtIndex(index)
    }
    
    open func didSelectCellAtIndexPath(_ indexPath: IndexPath) {
        let section = indexPath.section
        let index = indexPath.item
        sectionControllers[section].didSelectCellAtIndex(index)
    }
    
    open func sizeForCellAtIndexPath(_ indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        let index = indexPath.item
        return sectionControllers[section].sizeForCellAtIndex(index)
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        delegate?.willDisplayCellAtIndexPath(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        delegate?.didEndDisplayingCellAtIndexPath(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCellAtIndexPath(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return delegate?.sizeForCellAtIndexPath(indexPath) ?? .zero
    }
  
}
