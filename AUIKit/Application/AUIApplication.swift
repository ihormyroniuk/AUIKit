//
//  AUIApplication.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/6/19.
//

import UIKit

public protocol AUIApplication: UIApplicationDelegate where Self: UIApplication {
  
  // MARK: Launching
  
  func willFinishLaunchingLocation()
  func willFinishLaunchingRemoteNotification(payload: [AnyHashable: Any])
  func willFinishLaunching()
  func didFinishLaunchingLocation()
  func didFinishLaunchingRemoteNotification(payload: [AnyHashable: Any])
  func didFinishLaunching()
}
