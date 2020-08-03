//
//  AUIWindowPresentationUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 31.07.2020.
//

import XCTest
import AUIKit

class AUIWindowPresentationUnitTesting: XCTestCase {
    
    // MARK: Setting Window

    func testSettingView() {
        let window = UIWindow()
        let presentation = AUIWindowPresentation(window: window)
        
        let presentationWindow = presentation.window
        
        XCTAssert(presentationWindow == window, "Presentation window [\(presentationWindow))] is not the same as window [\(window)] used for initialization.")
    }
    
    // MARK: Calling Method Setup
    
    private class TestAUIWindowPresentation: AUIWindowPresentation {
        var isMethodSetupCalled = false
        override func setup() {
            super.setup()
            isMethodSetupCalled = true
        }
    }
    
    func testCallingMethodSetupDuringInitialization() {
        let window = UIWindow()
        
        let presentation = TestAUIWindowPresentation(window: window)
        let isMethodSetupCalled = presentation.isMethodSetupCalled
        
        XCTAssert(isMethodSetupCalled, "Method `setup()` is not called during initialization.")
    }
    
}
