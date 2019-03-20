//
//  AUIUpdatableLeftCollectionViewLayout.swift
//  AUIKit
//
//  Created by branderstudio on 3/11/19.
//

import UIKit

open class AUIUpdatableLeftCollectionViewLayout: AUIUpdatableWideCollectionViewLayout {
  
  // MARK: - Prepare for insert
  
  override func insertLayoutAttributes(for indexPath: IndexPath) {
    guard let cellController = delegate?.getCellController(for: indexPath) else { return }
    let cellSize = getCellSize(for: cellController)
    let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
    
    layoutAttributes.frame = calculateFrameForItem(indexPath: indexPath, itemSize: cellSize)
    
    let attributesToChange = itemsLayoutAttributes.filter { $0.indexPath >= indexPath }
    let sortedAttributesToChange = attributesToChange.sorted { $0.indexPath < $1.indexPath }
    itemsLayoutAttributes.append(layoutAttributes)
    
    sortedAttributesToChange.forEach { attributeItem in
      let oldIndexPath = attributeItem.indexPath
      let newIndexPath = IndexPath(row: oldIndexPath.row + 1, section: oldIndexPath.section)
      attributeItem.indexPath = newIndexPath
      attributeItem.frame = calculateFrameForItem(indexPath: newIndexPath, itemSize: attributeItem.frame.size)
    }
    updateContentSize()
  }
  
  func getIndexPathBefore(indexPath: IndexPath) -> IndexPath? {
    guard indexPath.row > 0 else  { return nil }
    if indexPath.row > 0 {
      return IndexPath(row: indexPath.row - 1, section: indexPath.section)
    } else {
      let previousSection = indexPath.section - 1
      let itemsCount = collectionView?.numberOfItems(inSection: previousSection) ?? 0
      return IndexPath(row: itemsCount - 1, section: previousSection)
    }
  }
  
  func calculateFrameForItem(indexPath: IndexPath, itemSize: CGSize) -> CGRect {
    guard
        let indexPathBefore = getIndexPathBefore(indexPath: indexPath),
        let attributesBefore = findLayoutAttributes(for: indexPathBefore)else {
      return CGRect(origin: .zero, size: itemSize)
    }
    let attributesInLine = itemsLayoutAttributes.filter { $0.indexPath < indexPath && $0.frame.origin.y == attributesBefore.frame.origin.y }
    let maxHeightAttributeInLine = attributesInLine.max { $0.frame.height < $1.frame.height }
    let collectionViewWidth = collectionViewContentSize.width
    if attributesBefore.frame.maxX + itemSize.width <= collectionViewWidth {
      return CGRect(
        origin: CGPoint(
          x: attributesBefore.frame.maxX,
          y: attributesBefore.frame.origin.y),
        size: itemSize)
    } else {
      return CGRect(
        origin: CGPoint(
          x: 0,
          y: maxHeightAttributeInLine?.frame.maxY ?? 0),
        size: itemSize)
    }
  }
  
  // MARK: - Prepare for delete
  
  override func deleteLayoutAttribute(for indexPath: IndexPath) {
    let foundLayoutAttribute = itemsLayoutAttributes.first { $0.indexPath == indexPath }
    guard let layoutAttribute = foundLayoutAttribute else { return }
    let attributesToChange = itemsLayoutAttributes.filter { $0.indexPath > indexPath }
    let sortedAttributesToChange = attributesToChange.sorted { $0.indexPath < $1.indexPath }
    
    if let index = itemsLayoutAttributes.firstIndex(of: layoutAttribute) {
      itemsLayoutAttributes.remove(at: index)
    }
    
    sortedAttributesToChange.forEach { attributeItem in
      let oldIndexPath = attributeItem.indexPath
      let newIndexPath = IndexPath(row: oldIndexPath.row - 1, section: oldIndexPath.section)
      attributeItem.indexPath = newIndexPath
      attributeItem.frame = calculateFrameForItem(indexPath: newIndexPath, itemSize: attributeItem.frame.size)
    }
    updateContentSize()
  }
  
  // MARK: - Recalculate cells sizes
  
  override open func recalculateCellsSizes() {
    let sortedItemsLayoutAttributes = getSortedByIndexPathLayoutAttributes()
    sortedItemsLayoutAttributes.forEach {
      $0.frame = calculateFrameForItem(indexPath: $0.indexPath, itemSize: $0.frame.size)
    }
    updateContentSize()
  }
  
  private func updateContentSize() {
    contentViewHeight = itemsLayoutAttributes.max { $0.frame.maxY < $1.frame.maxY }?.frame.maxY ?? 0
  }
  
  override func getCellSize(for cellController: AUICollectionViewCellController) -> CGSize {
    return calculateCellSize(for: cellController)
  }
  
}
