//
//  AUICollectionViewDataSourcePrefetchingProxy.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

// MARK: - AUICollectionViewDataSourcePrefetchingProxyDelegate

protocol AUICollectionViewDataSourcePrefetchingProxyDelegate: class {
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath])
}

// MARK: - AUICollectionViewDataSourcePrefetchingProxy

class AUICollectionViewDataSourcePrefetchingProxy: NSObject, UICollectionViewDataSourcePrefetching {
  
  weak var delegate: AUICollectionViewDataSourcePrefetchingProxyDelegate?
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    delegate?.collectionView(collectionView, prefetchItemsAt: indexPaths)
  }
  
}
