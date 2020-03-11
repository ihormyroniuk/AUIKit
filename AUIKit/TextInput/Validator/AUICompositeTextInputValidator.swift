//
//  AUICompositeTextInputValidator.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 11/29/19.
//

import Foundation

open class AUICompositeTextInputValidator: AUITextInputValidator {

    // MARK: Text Input Validators

    private let textInputValidators: [AUITextInputValidator]

    // MARK: Initializer

    public init(textInputValidators: [AUITextInputValidator]) {
        self.textInputValidators = textInputValidators
    }

    // MARK: AUITextInputValidator

    open func validate(textInput: String?) -> Bool {
        for textInputValidator in textInputValidators {
            if !textInputValidator.validate(textInput: textInput) {
                return false
            }
        }
        return true
    }

}
