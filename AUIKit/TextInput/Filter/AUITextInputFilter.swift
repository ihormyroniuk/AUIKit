//
//  AUITextFilter.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/4/19.
//

import Foundation

public protocol AUITextInputFilter {
    func filter(textInput: String?) -> String?
}
