//
//  AUIElementViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation
import UIKit

public protocol AUIViewController: AnyObject {
  
    // MARK: View
  
    var view: UIView? { get set }
  
    // MARK: User Interaction
  
    var isUserInteractionEnabled: Bool { get set }
  
    // MARK: First Responder
  
    var isFirstResponder: Bool { get }
  
    @discardableResult
    func becomeFirstResponder() -> Bool
  
    @discardableResult
    func resignFirstResponder() -> Bool
  
}
