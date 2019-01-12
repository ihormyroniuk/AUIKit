//
//  ContainerCollectionViewCell.swift
//  Smaug
//
//  Created by Ihor Myroniuk on 11/23/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

open class AUIGenericContainerTableViewCell<V: UIView>: AUIContainerTableViewCell {
  
  // MARK: Elements
  
  public let genericView: V = V()
  open override var view: UIView {
    return genericView
  }
  
  // MARK: Auto Layout
  
  open override func autoLayout() {
    super.autoLayout()
    autoLayoutView()
  }
  
  open func autoLayoutView() {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
    view.topAnchor.constraint(equalTo: contentView.topAnchor)
    view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
    view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
  }
  
}
