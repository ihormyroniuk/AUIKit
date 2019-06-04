//
//  AUITextFilter.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/4/19.
//

import Foundation

public protocol AUITextFilter {
  func filter(text: String?) -> String?
}
