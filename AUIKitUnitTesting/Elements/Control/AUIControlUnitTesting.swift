//
//  AUIControlUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 06.08.2020.
//

import XCTest
import AUIKit
import UIKit

class AUIControlUnitTesting: XCTestCase {
    
    // MARK: Calling Method Setup
    
    private class TestAUIControl: AUIControl {
        var isMethodSetupCalled = false
        override func setup() {
            super.setup()
            isMethodSetupCalled = true
        }
    }
    
    func testCallingMethodSetupDuringInitialization() {
        let control = TestAUIControl()
        let isMethodSetupCalled = control.isMethodSetupCalled
        
        XCTAssert(isMethodSetupCalled, "Method `setup()` is not called during initialization.")
    }
    
}
