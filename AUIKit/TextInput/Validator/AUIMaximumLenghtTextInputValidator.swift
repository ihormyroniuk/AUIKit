//
//  AUIMaximumLenghtTextInputValidator.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 11/29/19.
//

import Foundation

open class AUIMaximumLenghtTextInputValidator: AUITextInputValidator {

    // MARK: Text Input Validators

    private let maximumLength: UInt

    // MARK: Initializer

    public init(maximumLength: UInt) {
        self.maximumLength = maximumLength
    }

    // MARK: AUITextInputValidator

    open func validate(inputtedText: String?) -> Bool {
        guard let inputtedText = inputtedText else { return true }
        return inputtedText.count <= maximumLength
    }

}
