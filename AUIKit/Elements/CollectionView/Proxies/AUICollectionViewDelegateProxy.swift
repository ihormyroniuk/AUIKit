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
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
}

// MARK: - AUICollectionViewDelegateProxy

open class AUICollectionViewDelegateProxy: NSObject, UICollectionViewDelegate/*, UICollectionViewDelegateFlowLayout*/ {
  
  open weak var delegate: AUICollectionViewDelegateProxyDelegate?
  
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
  
  // MARK: - UICollectionViewDelegateFlowLayout
  
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    return delegate?.collectionView(collectionView, layout:collectionViewLayout, sizeForItemAt:indexPath) ?? CGSize.zero
//  }
  
  
}
