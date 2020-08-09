//
//  AUINavigationControllerUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 07.08.2020.
//

import XCTest
import AUIKit

class AUINavigationControllerUnitTesting: XCTestCase {
    
    // MARK: Calling Method Setup
    
    private class TestAUINavigationController: AUINavigationController {
        var isMethodSetupCalled = false
        override func setup() {
            super.setup()
            isMethodSetupCalled = true
        }
    }
    
    func testCallingMethodSetupDuringInitialization() {
        let navigationController = TestAUINavigationController()
        let isMethodSetupCalled = navigationController.isMethodSetupCalled
        
        XCTAssert(isMethodSetupCalled, "Method `setup()` is not called during initialization.")
    }
    
    // MARK: Navigation Bar
    
    func testNavigationBarHidden() {
        let navigationController = TestAUINavigationController()
        let isNavigationBarHidden = navigationController.isNavigationBarHidden
        
        XCTAssert(isNavigationBarHidden, "AUINavigationController should hide navigation bar.")
    }
    
}
