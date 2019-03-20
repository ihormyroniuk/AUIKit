//
//  AUIUpdatableCollectionViewController.swift
//  Copyright © 2019 BRANDER. All rights reserved.
//

import Foundation

open class AUIUpdatableCollectionViewController: AUIDefaultScrollViewController {
  
  // MARK: - Proxies
  
  private let delegateProxy = AUICollectionViewDelegateProxy()
  private let dataSourceProxy = AUICollectionViewDataSourceProxy()
  private let dataSourcePrefetchProxy = AUICollectionViewDataSourcePrefetchingProxy()
  
  // MARK: - Delegates
  
  open weak var scrollDelegate: AUIScrollViewDelegate? {
    set { delegateProxy.scrollDelegate = newValue }
    get { return delegateProxy.scrollDelegate }
  }
  
  open weak var scrollWillBeginDraggingDelegate: AUIScrollWillBeginDraggingDelegate? {
    set { delegateProxy.scrollWillBeginDraggingDelegate = newValue }
    get { return delegateProxy.scrollWillBeginDraggingDelegate }
  }
  
  // MARK: - Controllers
  
  private var cellControllers: [AUICollectionViewCellController] = []
  private var deletedCellControllers: [IndexPath: AUICollectionViewCellController] = [:]
  
  // MARK: - View
  
  open var collectionView: UICollectionView? {
    set { view = newValue }
    get { return view as? UICollectionView }
  }
  
  private var layout: (UICollectionViewLayout & AUIUpdatableCollectionViewLayout)? {
    return collectionView?.collectionViewLayout as? (UICollectionViewLayout & AUIUpdatableCollectionViewLayout)
  }
  
  // MARK: - Setup
  
  override open func setup() {
    super.setup()
    delegateProxy.delegate = self
    dataSourceProxy.delegate = self
    dataSourcePrefetchProxy.delegate = self
    layout?.delegate = self
  }
  
  override open func setupView() {
    super.setupView()
    collectionView?.dataSource = dataSourceProxy
    collectionView?.delegate = delegateProxy
    collectionView?.prefetchDataSource = dataSourcePrefetchProxy
    layout?.delegate = self
    collectionView?.reloadData()
  }
  
  override open func unsetupView() {
    collectionView?.dataSource = nil
    collectionView?.delegate = nil
    collectionView?.prefetchDataSource = nil
  }
  
  // MARK: - Cell controllers count
  
  open func getCellControllersCount() -> Int {
    return cellControllers.count
  }
  
  // MARK: - Update layout
  
  open func updateLayout() {
    layout?.recalculateCellsSizes()
  }
}

// MARK: - AUIInsertingCellControllers

extension AUIUpdatableCollectionViewController: AUIInsertingCellControllers {
  
  open func insertCellControllersAtBegin(_ cellControllers: [AUICollectionViewCellController], animated: Bool) {
    let cellCountBeforeInsert = self.cellControllers.count
    self.cellControllers.insert(contentsOf: cellControllers, at: 0)
    insertCellsAtBegin(for: cellControllers,
                       countBeforeInsert: cellCountBeforeInsert,
                       animated: animated)
  }
  
  open func insertCellControllersAtEnd(_ cellControllers: [AUICollectionViewCellController], animated: Bool) {
    let cellCountBeforeInsert = self.cellControllers.count
    self.cellControllers.append(contentsOf: cellControllers)
    insertCellsAtEnd(for: cellControllers, countBeforeInsert: cellCountBeforeInsert, animated: animated)
  }
  
  open func insertCellControllers(_ cellControllers: [AUICollectionViewCellController], before: AUICollectionViewCellController, animated: Bool) {
    guard let index = findIndex(of: before) else { return }
    let cellCountBeforeInsert = self.cellControllers.count
    self.cellControllers.insert(contentsOf: cellControllers, at: index)
    insertCells(with: cellControllers, before: index, countBeforeInsert: cellCountBeforeInsert, animated: animated)
  }
  
  open func insertCellControllers(_ cellControllers: [AUICollectionViewCellController], after: AUICollectionViewCellController, animated: Bool) {
    guard let index = findIndex(of: after) else { return }
    let newIndex = index + 1
    let cellCountBeforeInsert = self.cellControllers.count
    self.cellControllers.insert(contentsOf: cellControllers, at: newIndex)
    insertCells(with: cellControllers, after: index, countBeforeInsert: cellCountBeforeInsert, animated: animated)
  }
}

// MARK: - AUIDeletingCellControllers

extension AUIUpdatableCollectionViewController: AUIDeletingCellControllers {
  
  open func deleteCellControllers(_ cellControllers: [AUICollectionViewCellController], animated: Bool) {
    deleteCells(with: cellControllers, animated: animated)
  }
  
  open func deleteAllCellControllers(animated: Bool) {
    deleteCellControllers(cellControllers, animated: animated)
  }
}

// MARK: - UpdatableCollectionViewLayoutDelegate

extension AUIUpdatableCollectionViewController: AUIUpdatableCollectionViewLayoutDelegate {
  
  open func getCellControllers() -> [AUICollectionViewCellController] {
    return cellControllers
  }
  
  open func getIndexPath(for cellController: AUICollectionViewCellController) -> IndexPath? {
    return findIndexPath(for: cellController)
  }
  
  open func getCellController(for indexPath: IndexPath) -> AUICollectionViewCellController? {
    return findCellController(for: indexPath)
  }
}

// MARK: - AUICollectionViewDelegateProxyDelegate

extension AUIUpdatableCollectionViewController: AUICollectionViewDelegateProxyDelegate {
  
  open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    cellControllers[indexPath.row].didSelectCell()
  }
  
  open func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  open func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  open func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard !indexPath.isEmpty else { return }
    cellControllers[indexPath.row].willDisplayCell(cell, indexPath: indexPath)
  }
  
  open func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard !indexPath.isEmpty else { return }
    if deletedCellControllers[indexPath] != nil {
      deletedCellControllers.removeValue(forKey: indexPath)
    } else {
      cellControllers[indexPath.row].didEndDisplayCell()
    }
  }
}

// MARK: - AUICollectionViewDataSourceProxyDelegate

extension AUIUpdatableCollectionViewController: AUICollectionViewDataSourceProxyDelegate {
  
  open func numberOfItems(_ collectionView: UICollectionView) -> Int {
    return cellControllers.count
  }
  
  open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return cellControllers[indexPath.row].cellForRowAtIndexPath(indexPath, collectionView: collectionView)
  }
}

// MARK: - AUICollectionViewDataSourcePrefetchingProxyDelegate

extension AUIUpdatableCollectionViewController: AUICollectionViewDataSourcePrefetchingProxyDelegate {
  
  open func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    
  }
}

private extension AUIUpdatableCollectionViewController {
  
  // MARK: - Index pathes operations
  
  func findIndexPath(for cellController: AUICollectionViewCellController) -> IndexPath? {
    let index = cellControllers.firstIndex { $0 === cellController }
    guard let foundIndex = index else { return nil }
    return IndexPath(row: foundIndex, section: 0)
  }
  
  func findCellController(for indexPath: IndexPath) -> AUICollectionViewCellController? {
    guard indexPath.row >= 0 && indexPath.row < cellControllers.count else { return nil }
    return cellControllers[indexPath.row]
  }
  
  func findIndex(of cellController: AUICollectionViewCellController) -> Int? {
    return cellControllers.firstIndex { cellController === $0 }
  }
  
  // MARK: - Insert cells at begin
  
  func insertCellsAtBegin(for cellControllers: [AUICollectionViewCellController],
                          countBeforeInsert: Int,
                          animated: Bool) {
    let indexPaths = generateInsertAtBeginIndexPaths(cellCount: cellControllers.count)
    insertItems(indexPaths: indexPaths,
                countBeforeInsert: countBeforeInsert,
                animated: animated)
  }
  
  func generateInsertAtBeginIndexPaths(cellCount: Int) -> [IndexPath] {
    var indexPaths: [IndexPath] = []
    for index in 0..<cellCount {
      indexPaths.append(IndexPath(row: index, section: 0))
    }
    return indexPaths
  }
  
  // MARK: - Insert cells at end
  
  func insertCellsAtEnd(for cellControllers: [AUICollectionViewCellController],
                        countBeforeInsert: Int,
                        animated: Bool) {
    let indexPaths = generateInsertAtEndIndexPaths(cellCount: cellControllers.count, countBeforeInsert: countBeforeInsert)
    insertItems(indexPaths: indexPaths,
                countBeforeInsert: countBeforeInsert,
                animated: animated)
  }
  
  func generateInsertAtEndIndexPaths(cellCount: Int, countBeforeInsert: Int) -> [IndexPath] {
    var indexPaths: [IndexPath] = []
    let lastCellIndex = countBeforeInsert - 1
    let startCellIndex = lastCellIndex + 1
    for index in startCellIndex..<(startCellIndex + cellCount) {
      indexPaths.append(IndexPath(row: index, section: 0))
    }
    return indexPaths
  }
  
  // MARK: - Insert cells after
  
  func insertCells(with cellControllers: [AUICollectionViewCellController],
                   after: Int,
                   countBeforeInsert: Int,
                   animated: Bool) {
    let indexPaths = generateInsertAfterIndexPaths(cellCount: cellControllers.count, after: after)
    insertItems(indexPaths: indexPaths,
                countBeforeInsert: countBeforeInsert,
                animated: animated)
  }
  
  func generateInsertAfterIndexPaths(cellCount: Int, after: Int) -> [IndexPath] {
    var indexPaths: [IndexPath] = []
    for index in 0..<cellCount {
      indexPaths.append(IndexPath(row: index + after + 1, section: 0))
    }
    return indexPaths
  }
  
  // MARK: - Insert cells before
  
  func insertCells(with cellControllers: [AUICollectionViewCellController],
                   before: Int,
                   countBeforeInsert: Int,
                   animated: Bool) {
    let indexPaths = generateInsertBeforeIndexPaths(cellCount: cellControllers.count, before: before)
    insertItems(indexPaths: indexPaths,
                countBeforeInsert: countBeforeInsert,
                animated: animated)
  }
  
  func generateInsertBeforeIndexPaths(cellCount: Int, before: Int) -> [IndexPath] {
    var indexPaths: [IndexPath] = []
    for index in 0..<cellCount {
      indexPaths.append(IndexPath(row: index + before, section: 0))
    }
    return indexPaths
  }
  
  func insertItems(indexPaths: [IndexPath], countBeforeInsert: Int, animated: Bool) {
    layout?.prepareForInsert(at: indexPaths)
    if let collectionView = collectionView {
      if animated && canUpdateCollectionAnimated() {
        collectionView.insertItems(at: indexPaths)
      } else {
        collectionView.reloadData()
      }
    }
  }
  
  private func canUpdateCollectionAnimated() -> Bool {
    return collectionView?.window != nil
  }
  
  // MARK: - Delete cells
  
  func deleteCells(with cellControllersToDelete: [AUICollectionViewCellController], animated: Bool) {
    let indexPathsToDelete = generateDeleteIndexPaths(cellControllers: cellControllersToDelete, animated: animated)
    cellControllers = cellControllers.filter({ controller -> Bool in
      !cellControllersToDelete.contains(where: { $0 === controller })
    })
    deleteItems(at: indexPathsToDelete, animated: animated)
  }
  
  func generateDeleteIndexPaths(cellControllers: [AUICollectionViewCellController], animated: Bool) -> [IndexPath] {
    var indexPathsToDelete: [IndexPath] = []
    cellControllers.forEach { cellControllerItem in
      if let index = findIndexPath(for: cellControllerItem) {
        indexPathsToDelete.append(index)
        deletedCellControllers[index] = cellControllerItem
      }
    }
    if !animated {
      self.cellControllers.forEach { cellControllerItem in
        if let index = findIndexPath(for: cellControllerItem) {
          deletedCellControllers[index] = cellControllerItem
        }
      }
    }
    return indexPathsToDelete
  }
  
  func deleteItems(at indexPaths: [IndexPath], animated: Bool) {
    layout?.prepareForDelete(at: indexPaths)
    if let collectionView = collectionView {
      if animated, canUpdateCollectionAnimated() {
        collectionView.deleteItems(at: indexPaths)
      } else {
        collectionView.reloadData()
      }
    }
  }
}
