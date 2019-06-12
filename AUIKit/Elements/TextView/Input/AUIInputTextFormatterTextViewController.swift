//
//  AUIInputTextFormatterTextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/5/19.
//

import Foundation

public protocol AUIInputTextFormatterTextViewController: AUITextViewController {
  var inputTextFormatter: AUITextInputFormatter? { get set }
}
