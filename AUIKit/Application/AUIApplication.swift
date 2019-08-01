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
  func willFinishLaunchingNotification(payload: [AnyHashable: Any])
  func willFinishLaunchingLocation()
  func didFinishLaunching()
  func didFinishLaunchingNotification(payload: [AnyHashable: Any])
  func didFinishLaunchingLocation()
  
  // MARK: States
  
  func willEnterForeground()
  func didBecomeActive()
  func willResignActive()
  func didEnterBackground()
  func willTerminate()
  
  // MARK: Memory
  
  func didReceiveMemoryWarning()
  
}
