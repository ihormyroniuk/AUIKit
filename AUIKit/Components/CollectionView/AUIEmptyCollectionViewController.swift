//
//  AUIEmptyCollectionViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

open class AUIEmptyCollectionViewController: AUIEmptyScrollViewController, AUICollectionViewController, AUICollectionViewDelegateProxyDelegate {
    
    // MARK: Delegates
  
    private let tableViewDelegateProxy = UICollectionViewDelegateProxy()
  
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
        tableViewDelegateProxy.delegate = self
    }
  
    // MARK: View
  
    open var collectionView: UICollectionView? {
        set { view = newValue }
        get { return view as? UICollectionView }
    }
  
    open override func setupView() {
        super.setupView()
        collectionView?.dataSource = tableViewDelegateProxy
        collectionView?.delegate = tableViewDelegateProxy
        collectionView?.prefetchDataSource = tableViewDelegateProxy
        collectionView?.reloadData()
    }

    open override func unsetupView() {
        super.unsetupView()
        collectionView?.dataSource = nil
        collectionView?.delegate = nil
        collectionView?.prefetchDataSource = nil
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
            let index = indexPath.row
            sectionControllers[section].prefetchCellAtIndex(index)
        }
    }
    
    open func cancelPrefetchingForItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let section = indexPath.section
            let index = indexPath.row
            sectionControllers[section].cancelPrefetchingForCellAtIndex(index)
        }
    }
    
    open func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        return sectionControllers[section].cellForItemAtIndexPath(indexPath)
    }
    
}

private protocol AUICollectionViewDelegateProxyDelegate: AnyObject {
  
    func numberOfSections() -> Int
    func numberOfItemsInSection(_ section: Int) -> Int
  
    // MARK: Cells
  
    func prefetchItemsAtIndexPaths(_ indexPaths: [IndexPath])
    func cancelPrefetchingForItemsAtIndexPaths(_ indexPaths: [IndexPath])
    func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell
    
}

private class UICollectionViewDelegateProxy: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDataSourcePrefetching {
      
    weak var delegate: AUICollectionViewDelegateProxyDelegate?
    
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
  
}
