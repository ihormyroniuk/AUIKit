//
//  AUITextFormatter.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

public protocol AUITextFormatter {
  func format(text: String?) -> String?
  func unformat(formattedText: String?) -> String?
}
