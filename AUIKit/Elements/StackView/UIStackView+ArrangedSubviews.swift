//
//  UIStackView+ArrangedSubviews.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 4/23/19.
//

import UIKit

public extension UIStackView {
  
  public func addArrangedSubviews(_ views: [UIView]) {
    views.forEach({ addArrangedSubview($0) })
  }
  
  public func removeArrangedSubviews(_ views: [UIView]) {
    views.forEach({ removeArrangedSubview($0) })
  }
  
  public func removeAllArrangedSubviews() {
    removeArrangedSubviews(arrangedSubviews)
  }
  
}
