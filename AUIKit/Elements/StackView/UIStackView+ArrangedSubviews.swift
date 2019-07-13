//
//  UIStackView+ArrangedSubviews.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 4/23/19.
//

import UIKit

public extension UIStackView {
  
  func addArrangedSubviews(_ views: [UIView]) {
    views.forEach({ addArrangedSubview($0) })
  }
  
  func removeArrangedSubviews(_ views: [UIView]) {
    views.forEach({ removeArrangedSubview($0) })
  }
  
  func removeAllArrangedSubviews() {
    removeArrangedSubviews(arrangedSubviews)
  }
  
}
