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
  func willFinishLaunchingNotification(payload: [AnyHashable: Any])
  func willFinishLaunching()
  func didFinishLaunchingLocation()
  func didFinishLaunchingNotification(payload: [AnyHashable: Any])
  func didFinishLaunching()
  
  // MARK: States
  
  func willEnterForeground()
  func didBecomeActive()
  func willResignActive()
  func didEnterBackground()
  func willTerminate()
  
  // MARK: Memory
  
  func didReceiveMemoryWarning()
  
}
