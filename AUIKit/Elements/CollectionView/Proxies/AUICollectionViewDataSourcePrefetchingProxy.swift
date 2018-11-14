//
//  AUICollectionViewDataSourcePrefetchingProxy.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

// MARK: - AUICollectionViewDataSourcePrefetchingProxyDelegate

public protocol AUICollectionViewDataSourcePrefetchingProxyDelegate: class {
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath])
}

// MARK: - AUICollectionViewDataSourcePrefetchingProxy

open class AUICollectionViewDataSourcePrefetchingProxy: NSObject, UICollectionViewDataSourcePrefetching {
  
  open weak var delegate: AUICollectionViewDataSourcePrefetchingProxyDelegate?
  
  open func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    delegate?.collectionView(collectionView, prefetchItemsAt: indexPaths)
  }
  
}
