//
//  UIPageControl+PrefferedSize.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/22/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public extension UIPageControl {
  
  var preferedSize: CGSize {
    return size(forNumberOfPages: numberOfPages)
  }
  
  var preferredWidth: CGFloat {
    return size(forNumberOfPages: numberOfPages).width
  }
  
  var preferredHeight: CGFloat {
    return size(forNumberOfPages: numberOfPages).height
  }
  
}
