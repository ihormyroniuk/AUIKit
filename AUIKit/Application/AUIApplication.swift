//
//  AUIApplication.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/6/19.
//

import UIKit

public protocol AUIApplication: UIApplicationDelegate, UISceneDelegate where Self: UIApplication {
    
    // MARK: Launching
  
    func willFinishLaunching()
    func willFinishLaunchingNotification(payload: [AnyHashable: Any])
    func willFinishLaunchingLocation()
    func willFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)
    func didFinishLaunching()
    func didFinishLaunchingNotification(payload: [AnyHashable: Any])
    func didFinishLaunchingLocation()
    func didFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)
  
    // MARK: States
  
    func willEnterForeground()
    func didBecomeActive()
    func willResignActive()
    func didEnterBackground()
    func willTerminate()
  
    // MARK: Memory
  
    func didReceiveMemoryWarning()
  
    // MARK: Remote Notifications
  
    func didRegisterForRemoteNotificationsWithDeviceToken(_ deviceToken: Data)
    func didFailToRegisterForRemoteNotificationsWithError(_ error: Error)
    func didReceiveRemoteNotification(userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    
    // MARK: Time
    
    func significantTimeChange()
    
    // MARK: URL
    
    func open(url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
  
}
