//
//  AUITextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/11/19.
//

import UIKit

public protocol AUITextView {
  func textViewSetText(_ text: String?)
}

public protocol AUITextViewController {
  
  // MARK: View
  
  var textView: (UIView & AUITextView)? { get set }
  
  // MARK: Text
  
  var text: String? { get set }
}
