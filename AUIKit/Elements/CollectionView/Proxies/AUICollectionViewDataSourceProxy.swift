//
//  AUICollectionViewDataSourceProxy.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

// MARK: - AUICollectionViewDataSourceProxyDelegate

protocol AUICollectionViewDataSourceProxyDelegate: class {
  func numberOfItems(_ collectionView: UICollectionView) -> Int
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

// MARK: - AUICollectionViewDataSourceProxy

class AUICollectionViewDataSourceProxy: NSObject, UICollectionViewDataSource {
  
  weak var delegate: AUICollectionViewDataSourceProxyDelegate?
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return delegate?.numberOfItems(collectionView) ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return delegate?.collectionView(collectionView, cellForItemAt: indexPath) ?? UICollectionViewCell()
  }
  
}
