//
//  ImageViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/14/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultImageViewController: AUIDefaultViewController, AUIImageViewController {
  
  // MARK: Image View
  
  open var imageView: UIImageView? {
    set { view = newValue }
    get { return view as? UIImageView }
  }
  
  // MARK: Setup
  
  open override func setupView() {
    super.setupView()
    imageView?.image = image
  }
  
  // MARK: State
  
  open var image: UIImage? {
    didSet { didSetImage() }
  }
  open func didSetImage() {
    imageView?.image = image
  }
  
}
