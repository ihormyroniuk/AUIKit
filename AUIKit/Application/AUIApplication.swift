//
//  AUIApplication.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/6/19.
//

import UIKit

public protocol AUIApplication: UIApplicationDelegate where Self: UIApplication {
    
    // MARK: - Launching
  
    func willFinishLaunching()
    func willFinishLaunchingNotification(payload: [AnyHashable: Any])
    func willFinishLaunchingLocation()
    func willFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)
    func didFinishLaunching()
    func didFinishLaunchingNotification(payload: [AnyHashable: Any])
    func didFinishLaunchingLocation()
    func didFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)
  
    // MARK: - State
  
    func willEnterForeground()
    func didBecomeActive()
    func willResignActive()
    func didEnterBackground()
    func willTerminate()
  
    // MARK: - Memory
  
    func didReceiveMemoryWarning()
    
    // MARK: - Time
    
    func significantTimeChange()
    
    // MARK: - URL
    
    func open(url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
  
}
