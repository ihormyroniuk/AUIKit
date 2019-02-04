//
//  AUIUpdatableWideCollectionViewLayout.swift
//  Copyright © 2019 BRANDER. All rights reserved.
//

import UIKit

public protocol AUIUpdatableCollectionViewLayoutDelegate: class {
  func getCellControllers() -> [AUICollectionViewCellController]
  func getIndexPath(for cellController: AUICollectionViewCellController) -> IndexPath?
  func getCellController(for indexPath: IndexPath) -> AUICollectionViewCellController?
}

public protocol AUIUpdatableCollectionViewLayout: class {
  var delegate: AUIUpdatableCollectionViewLayoutDelegate? { get set }
  func prepareForInsert(at indexPaths: [IndexPath])
  func prepareForDelete(at indexPaths: [IndexPath])
}

open class AUIUpdatableWideCollectionViewLayout: UICollectionViewLayout, AUIUpdatableCollectionViewLayout {
  
  // MARK: - Delegate
  
  weak public var delegate: AUIUpdatableCollectionViewLayoutDelegate?
  
  // MARK: - Private variables
  
  private var contentViewHeight: CGFloat = 0
  
  private var itemsLayoutAttributes: [UICollectionViewLayoutAttributes] = []
  
  private let mockCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  // MARK: - Prepare
  
  override open func prepare() {
    super.prepare()
    contentViewHeight = 0
    
    guard let delegate = delegate else { return }
    let cellControllers = delegate.getCellControllers()
    
    for cellController in cellControllers {
      guard let indexPath = delegate.getIndexPath(for: cellController) else { continue }
      
      if findLayoutAttributes(for: indexPath) == nil {
        let cell = cellController.cellForRowAtIndexPath(indexPath, collectionView: mockCollectionView)
        let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let cellSize = cell.sizeThatFits(CGSize(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude))
        layoutAttributes.frame = CGRect(x: 0, y: contentViewHeight, width: cellSize.width, height: cellSize.height)
        itemsLayoutAttributes.append(layoutAttributes)
        print("prepare cell: \(indexPath)")
        contentViewHeight += cellSize.height
      }
    }
  }
  
  override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return itemsLayoutAttributes.filter({ return rect.intersects($0.frame) })
  }
  
  override open var collectionViewContentSize: CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: contentViewHeight)
  }
  
  open func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
    mockCollectionView.register(cellClass, forCellWithReuseIdentifier: identifier)
  }
  
  func prepareLayoutAttributesAfterInsert(indexPath: IndexPath) -> UICollectionViewLayoutAttributes {
    let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
    return layoutAttributes
  }
  
  // MARK: - Prepare for insert
  
  open func prepareForInsert(at indexPaths: [IndexPath]) {
    let sortedIndexPaths = indexPaths.sorted()
    sortedIndexPaths.forEach { insertLayoutAttributes(for: $0) }
  }
  
  private func insertLayoutAttributes(for indexPath: IndexPath) {
    guard let cellController = delegate?.getCellController(for: indexPath) else { return }
    let cell = cellController.cellForRowAtIndexPath(indexPath, collectionView: mockCollectionView)
    let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
    let cellSize = cell.sizeThatFits(CGSize(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude))
    
    let attributesToChange = itemsLayoutAttributes.filter { $0.indexPath >= indexPath }
    attributesToChange.forEach {
      $0.indexPath.row += 1
      $0.frame.origin.y += cellSize.height
    }
    
    contentViewHeight += cellSize.height
    let heightAbove = getHeightBefore(indexPath: indexPath)
    layoutAttributes.frame = CGRect(x: 0, y: heightAbove, width: cellSize.width, height: cellSize.height)
    itemsLayoutAttributes.append(layoutAttributes)
  }
  
  private func getHeightBefore(indexPath: IndexPath) -> CGFloat {
    let attributesAbove = itemsLayoutAttributes.filter { $0.indexPath < indexPath }
    let heightAbove = attributesAbove.reduce(into: 0, { (result, attribute) in
      result += attribute.frame.height
    })
    return heightAbove
  }
  
  // MARK: - Prepare for delete
  
  open func prepareForDelete(at indexPaths: [IndexPath]) {
    indexPaths.forEach { deleteLayoutAttribute(for: $0) }
  }
  
  private func deleteLayoutAttribute(for indexPath: IndexPath) {
    let foundLayoutAttribute = itemsLayoutAttributes.first { $0.indexPath == indexPath }
    guard let layoutAttribute = foundLayoutAttribute else { return }
    let attributesToChange = itemsLayoutAttributes.filter { $0.indexPath > indexPath }
    
    if let index = itemsLayoutAttributes.firstIndex(of: layoutAttribute) {
      itemsLayoutAttributes.remove(at: index)
    }
    attributesToChange.forEach {
      $0.frame.origin.y -= layoutAttribute.frame.height
      $0.indexPath.row -= 1
    }
  }
  
  // MARK: - Find layout attributes
  
  private func findLayoutAttributes(for indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return itemsLayoutAttributes.first { $0.indexPath == indexPath }
  }
}
