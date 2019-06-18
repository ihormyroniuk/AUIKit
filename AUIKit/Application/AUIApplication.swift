//
//  AUIApplication.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/6/19.
//

import UIKit

public protocol AUIApplication: UIApplicationDelegate {
  func willFinishLaunching()
  func willFinishLaunchingLocation()
  func didFinishLaunching()
  func didFinishLaunchingLocation()
}
