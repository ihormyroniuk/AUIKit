//
//  AUINotAllowedCharactersTextInputValidator.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 21.05.2020.
//

import Foundation

open class AUINotAllowedCharactersTextInputValidator: AUITextInputValidator {

    // MARK: Text Input Validators

    private let notAllowedCharacters: CharacterSet

    // MARK: Initializer

    public init(notAllowedCharacters: CharacterSet) {
        self.notAllowedCharacters = notAllowedCharacters
    }

    // MARK: AUITextInputValidator

    open func validate(textInput: String?) -> Bool {
        guard let inputtedText = textInput else { return true }
        let inputtedCharacterSet = CharacterSet(charactersIn: inputtedText)
        let isValid = inputtedCharacterSet.intersection(notAllowedCharacters).isEmpty
        return isValid
    }

}
