//
//  AUIViewUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 03.08.2020.
//

import XCTest
import AUIKit
import UIKit

class AUIViewUnitTesting: XCTestCase {
    
    // MARK: Calling Method Setup
    
    private class TestAUIView: AUIView {
        var isMethodSetupCalled = false
        override func setup() {
            super.setup()
            isMethodSetupCalled = true
        }
    }
    
    func testCallingMethodSetupDuringInitialization() {
        let view = TestAUIView()
        let isMethodSetupCalled = view.isMethodSetupCalled
        
        XCTAssert(isMethodSetupCalled, "Method `setup()` is not called during initialization.")
    }
    
}
