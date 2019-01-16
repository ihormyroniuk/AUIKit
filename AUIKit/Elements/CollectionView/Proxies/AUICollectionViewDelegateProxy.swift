//
//  AUICollectionViewDataSource.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

// MARK: - AUICollectionViewDelegateProxyDelegate

public protocol AUICollectionViewDelegateProxyDelegate: class {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
  func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
}

// MARK: - AUIScrollViewDelegateProxyDelegate

public protocol AUIScrollViewDelegate: class {
  func scrollViewDidScroll(_ scrollView: UIScrollView)
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
  func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView)
}

public protocol AUIScrollWillBeginDraggingDelegate: class {
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
}

// MARK: - AUICollectionViewDelegateProxy

open class AUICollectionViewDelegateProxy: NSObject, UICollectionViewDelegate {
  
  open weak var delegate: AUICollectionViewDelegateProxyDelegate?
  open weak var scrollDelegate: AUIScrollViewDelegate?
  open weak var scrollWillBeginDraggingDelegate: AUIScrollWillBeginDraggingDelegate?
  
  open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.collectionView(collectionView, didSelectItemAt: indexPath)
  }
  
  open func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    return delegate?.collectionView(collectionView, shouldSelectItemAt: indexPath) ?? true
  }
  
  open func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    return delegate?.collectionView(collectionView, shouldHighlightItemAt: indexPath) ?? true
  }
  
  open func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    delegate?.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
  }
  
  open func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    delegate?.collectionView(collectionView, didEndDisplaying: cell, forItemAt: indexPath)
  }
  
  open func scrollViewDidScroll(_ scrollView: UIScrollView) {
    scrollDelegate?.scrollViewDidScroll(scrollView)
  }
  
  open func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    scrollDelegate?.scrollViewDidEndDecelerating(scrollView)
  }
  
  open func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    scrollDelegate?.scrollViewDidEndScrollingAnimation(scrollView)
  }
  
  open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    scrollWillBeginDraggingDelegate?.scrollViewWillBeginDragging(scrollView)
  }
  
}
