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
    contentView.addConstraints([
      NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
    ])
  }
  
}
