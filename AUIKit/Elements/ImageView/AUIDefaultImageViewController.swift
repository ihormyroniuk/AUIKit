//
//  ImageViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/14/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultImageViewController: AUIDefaultViewController, AUIImageViewController {
  
  // MARK: ImageView
  
  open var imageView: UIImageView? {
    set {
      view = newValue
    }
    get {
      return view as? UIImageView
    }
  }
  
  open override func setupView() {
    super.setupView()
    setupImageView()
  }
  
  open func setupImageView() {
    imageView?.image = image
  }
  
  open override func unsetupView() {
    super.unsetupView()
    unsetupImageView()
  }
  
  open func unsetupImageView() {
    imageView?.image = image
  }
  
  // MARK: State
  
  open var image: UIImage? {
    didSet {
      didSetImage()
    }
  }
  open func didSetImage() {
    imageView?.image = image
  }
  
}
