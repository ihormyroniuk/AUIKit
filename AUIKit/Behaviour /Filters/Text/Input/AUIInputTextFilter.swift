//
//  AUIInputTextFilter.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/4/19.
//

import Foundation

public protocol AUIInputTextFilter {
  func filterInputText(_ text: String?) -> String?
}
