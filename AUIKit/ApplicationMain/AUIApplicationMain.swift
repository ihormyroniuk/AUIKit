//
//  AUIApplicationMain.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 4/7/20.
//

import UIKit

@discardableResult
public func AUIApplicationMain(_ argc: Int32, _ argv: UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>, _ applicationClass: UIApplication.Type) -> Int32 {
    let principalClassName = NSStringFromClass(applicationClass)
    return UIApplicationMain(argc, argv, principalClassName, principalClassName)
}
