//
//  AUIApplication.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/24/19.
//

import UIKit

open class AUIDefaultApplication: UIApplication, AUIApplication {
 
  open var window: UIWindow?
  
  // MARK: Launching
  
  open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
      willFinishLaunchingLocation()
      return true
    }
    willFinishLaunching()
    return true
  }
  
  open func willFinishLaunchingLocation() {
    
  }
  
  public func willFinishLaunchingRemoteNotification(payload: [AnyHashable : Any]) {
    
  }
  
  open func willFinishLaunching() {
    
  }
  
  open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
      didFinishLaunchingLocation()
      return true
    }
    didFinishLaunching()
    return true
  }
  
  open func didFinishLaunchingLocation() {
    
  }
  
  public func didFinishLaunchingRemoteNotification(payload: [AnyHashable : Any]) {
    
  }
  
  open func didFinishLaunching() {
    
  }
  
}
