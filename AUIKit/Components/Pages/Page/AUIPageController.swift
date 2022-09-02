//
//  AUIPageController.swift
//  Level
//
//  Created by Ihor Myroniuk on 10/26/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIPageController: AnyObject {
    
    var viewController: UIViewController { get }
    
    // MARK: - Events
    
    var willDisplay: (() -> Void)? { get set }
    
    var didDisplay: (() -> Void)? { get set }
    
    // MARK: - Actions
    
    func willDisplayPage()
    
    func didDisplayPage()
    
}
