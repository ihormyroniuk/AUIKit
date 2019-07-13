//
//  AUIImageViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/6/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIImageViewController: AUIViewController {
  
  // MARK: ImageView
  
  var imageView: UIImageView? { get set }
  
  // MARK: Image
  
  var image: UIImage? { get set }
  
}
