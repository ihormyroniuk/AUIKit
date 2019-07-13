//
//  AUIApplication.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/6/19.
//

import UIKit

public protocol AUIApplication: UIApplicationDelegate where Self: UIApplication {
  
  // MARK: Launching
  
  func willFinishLaunching()
  func willFinishLaunchingLocation()
  func didFinishLaunching()
  func didFinishLaunchingLocation()
  
}
