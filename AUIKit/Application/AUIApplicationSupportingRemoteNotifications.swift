//
//  AUIApplicationSupportingRemoteNotifications.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 21.08.2022.
//

import Foundation


import UIKit

public protocol AUIApplicationSupportingRemoteNotifications: AUIApplication {
    
    // MARK: - Remote Notifications

    func didRegisterForRemoteNotificationsWithDeviceToken(_ deviceToken: Data)
    func didFailToRegisterForRemoteNotificationsWithError(_ error: Error)
    func didReceiveRemoteNotification(userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
  
}
