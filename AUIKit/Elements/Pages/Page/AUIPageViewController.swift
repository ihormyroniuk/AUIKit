//
//  AUIPageController.swift
//  Level
//
//  Created by Ihor Myroniuk on 10/26/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIPageViewController {
  var viewController: AUIViewController { get }
  var view: () -> UIView { get }
}
