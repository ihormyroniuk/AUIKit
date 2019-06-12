//
//  AUIApplication.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/24/19.
//

import UIKit

open class AUIDefaultApplication: NSObject, AUIApplication {
  
  open var window: UIWindow?
  
  open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
      willFinishLaunchingLocation()
      return true
    }
    if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
      willFinishLaunchingShortcutItem(shortcutItem)
      return true
    }
    willFinishLaunching()
    return true
  }
  
  open func willFinishLaunchingLocation() {
    
  }
  
  open func willFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem) {
    
  }
  
  open func willFinishLaunching() {
    
  }
  
  open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
      didFinishLaunchingLocation()
      return true
    }
    if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
      didFinishLaunchingShortcutItem(shortcutItem)
      return true
    }
    didFinishLaunching()
    return true
  }
  
  open func didFinishLaunchingLocation() {
    
  }
  
  open func didFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem) {
    
  }
  
  open func didFinishLaunching() {
    
  }
  
}
