//
//  AUIInputTextFilterTextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/5/19.
//

import Foundation

public protocol AUIInputTextFilterTextViewController: AUITextViewController {
  var inputTextFilter: AUITextInputFilter? { get set }
}
