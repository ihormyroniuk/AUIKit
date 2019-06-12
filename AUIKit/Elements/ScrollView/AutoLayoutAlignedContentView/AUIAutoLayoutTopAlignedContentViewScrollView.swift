//
//  AutoLayoutTopAlignedContentViewScrollView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/6/19.
//

import UIKit

open class AUIAutoLayoutTopAlignedContentViewScrollView: AUIAutoLayoutAlignedContentViewScrollView {
  
  override open func autoLayoutContentAlignmentView() {
    contentAlignmentView.translatesAutoresizingMaskIntoConstraints = false
    addConstraints([
      NSLayoutConstraint(item: contentAlignmentView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentAlignmentView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentAlignmentView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentAlignmentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentAlignmentView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentAlignmentView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .height, multiplier: 1, constant: 0)
    ])
  }
  
  override open func autoLayoutContentView() {
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
    contentAlignmentView.addConstraints([
      NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: contentAlignmentView, attribute: .leading, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: contentAlignmentView, attribute: .top, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: contentAlignmentView, attribute: .trailing, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: contentAlignmentView, attribute: .bottom, multiplier: 1, constant: 0)
    ])
  }
  
}
