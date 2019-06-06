//
//  AUIApplication.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/24/19.
//

import UIKit

open class AUIDefaultApplication: UIApplication, AUIApplication {
  
  open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    return willFinishLaunching()
  }
  
  open func willFinishLaunching() -> Bool {
    return true
  }
  
  open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    return didFinishLaunching()
  }
  
  open func didFinishLaunching() -> Bool {
    return true
  }
  
}
