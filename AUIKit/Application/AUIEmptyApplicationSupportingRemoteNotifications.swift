//
//  AUIEmptyApplicationWithRemoteNotifications.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 21.08.2022.
//

import Foundation

import UIKit

open class AUIEmptyApplicationSupportingRemoteNotifications: AUIEmptyApplication, AUIApplicationSupportingRemoteNotifications {
 
    // MARK: - Remote Notifications
  
    open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        didRegisterForRemoteNotificationsWithDeviceToken(deviceToken)
    }
  
    open func didRegisterForRemoteNotificationsWithDeviceToken(_ deviceToken: Data) {
        
    }
  
    open func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        didFailToRegisterForRemoteNotificationsWithError(error)
    }
  
    open func didFailToRegisterForRemoteNotificationsWithError(_ error: Error) {
        
    }
  
    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        didReceiveRemoteNotification(userInfo: userInfo, fetchCompletionHandler: completionHandler)
    }
  
    open func didReceiveRemoteNotification(userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
    
}
