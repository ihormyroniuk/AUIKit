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
  func willFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)
  func didFinishLaunching()
  func didFinishLaunchingLocation()
  func didFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)
}
