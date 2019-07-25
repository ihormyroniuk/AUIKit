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
    if let payload = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] as? [AnyHashable: Any] {
      willFinishLaunchingNotification(payload: payload)
      return true
    }
    willFinishLaunching()
    return true
  }
  
  open func willFinishLaunchingLocation() {
    
  }
  
  public func willFinishLaunchingNotification(payload: [AnyHashable : Any]) {
    
  }
  
  open func willFinishLaunching() {
    
  }
  
  open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
      didFinishLaunchingLocation()
      return true
    }
    if let payload = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] as? [AnyHashable: Any] {
      didFinishLaunchingNotification(payload: payload)
      return true
    }
    didFinishLaunching()
    return true
  }
  
  open func didFinishLaunchingLocation() {
    
  }
  
  public func didFinishLaunchingNotification(payload: [AnyHashable : Any]) {
    
  }
  
  open func didFinishLaunching() {
    
  }
  
}
