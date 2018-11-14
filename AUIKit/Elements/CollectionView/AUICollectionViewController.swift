//
//  AUICollectionViewController.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

class AUICollectionViewController: AUIDefaultScrollViewController {
  
  // MARK: - Proxies
  
  private let delegateProxy = AUICollectionViewDelegateProxy()
  private let dataSourceProxy = AUICollectionViewDataSourceProxy()
  private let dataSourcePrefetchProxy = AUICollectionViewDataSourcePrefetchingProxy()
  private var isBatchUpdates = false
  
  // MARK: - Controllers
  
  var cellControllers: [AUICollectionViewCellController] = []
  
  // MARK: - View
  
  var collectionView: UICollectionView? {
    set { view = newValue }
    get { return view as? UICollectionView }
  }
  
  // MARK: - Setup
  
  override func setup() {
    super.setup()
    delegateProxy.delegate = self
    dataSourceProxy.delegate = self
    dataSourcePrefetchProxy.delegate = self
  }
  
  override func setupView() {
    super.setupView()
    collectionView?.dataSource = dataSourceProxy
    collectionView?.delegate = delegateProxy
    collectionView?.prefetchDataSource = dataSourcePrefetchProxy
    collectionView?.reloadData()
  }
  
  override func unsetupView() {
    collectionView?.dataSource = nil
    collectionView?.delegate = nil
    collectionView?.prefetchDataSource = nil
  }
  
  // MARK: - Reload
  
  func reload() {
    collectionView?.reloadData()
  }
  
  func reloadAnimated(oldCount: Int, newCount: Int) {
    isBatchUpdates = true
    let oldIndexPathes = createIndexPathes(count: oldCount)
    let newIndexPathes = createIndexPathes(count: newCount)
    collectionView?.performBatchUpdates({ [weak self] in
      guard let strongSelf = self else { return }
      strongSelf.collectionView?.deleteItems(at: oldIndexPathes)
      strongSelf.collectionView?.insertItems(at: newIndexPathes)
    }, completion: { [weak self] result in
      guard let strongSelf = self else { return }
      strongSelf.isBatchUpdates = false
    })
    
  }
  
  private func createIndexPathes(count: Int, section: Int = 0) -> [IndexPath] {
    var indexPathes: [IndexPath] = []
    for index in 0..<count {
      indexPathes.append(IndexPath(item: index, section: section))
    }
    return indexPathes
  }
}

// MARK: - AUICollectionViewDelegateProxyDelegate

extension AUICollectionViewController: AUICollectionViewDelegateProxyDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    cellControllers[indexPath.row].didSelectCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    cellControllers[indexPath.row].willDisplayCell(cell)
  }
  
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//    if !isBatchUpdates {
      cellControllers[indexPath.row].didEndDisplayCell()
//    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return cellControllers[indexPath.row].size
  }
  
}

// MARK: - AUICollectionViewDataSourceProxyDelegate

extension AUICollectionViewController: AUICollectionViewDataSourceProxyDelegate {
  
  func numberOfItems(_ collectionView: UICollectionView) -> Int {
    return cellControllers.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return cellControllers[indexPath.row].cellForRowAtIndexPath(indexPath, collectionView: collectionView)
  }
  
}

// MARK: - AUICollectionViewDataSourcePrefetchingProxyDelegate

extension AUICollectionViewController: AUICollectionViewDataSourcePrefetchingProxyDelegate {
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    
  }
  
}
