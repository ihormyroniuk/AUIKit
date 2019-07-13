//
//  AutoLayoutAlignedContentViewScrollView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/6/19.
//

import UIKit

open class AUIAutoLayoutAlignedContentViewScrollView: AUIScrollView {
  
  // MARK: Componenets
  
  public let contentAlignmentView = UIView()
  public let contentView = UIView()
  
  // MARK: Setup
  
  override open func setup() {
    super.setup()
    addSubview(contentAlignmentView)
    setupContentAlignmentView()
    contentAlignmentView.addSubview(contentView)
    setupContentView()
  }
  
  open func setupContentAlignmentView() {
    contentAlignmentView.backgroundColor = .clear
  }
  
  open func setupContentView() {
    contentView.backgroundColor = .clear
  }
  
  // MARK: AutoLayout
  
  override open func autoLayout() {
    super.autoLayout()
    autoLayoutContentAlignmentView()
    autoLayoutContentView()
  }
  
  open func autoLayoutContentAlignmentView() {
    
  }
  
  open func autoLayoutContentView() {
    
  }
  
}
