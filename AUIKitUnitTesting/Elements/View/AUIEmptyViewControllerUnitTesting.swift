//
//  AUIViewUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 30.07.2020.
//

import XCTest
import AUIKit
import UIKit

class AUIEmptyViewControllerUnitTesting: XCTestCase {
    
    // MARK: Set isUserInteractionEnabled
    
    func testSettingViewIsUserInteractionEnabledBeforeSettingView() {
        let view = UIView()
        let viewController = AUIEmptyViewController()
        
        viewController.isUserInteractionEnabled = false
        viewController.view = view
        let viewIsUserInteractionEnabled = view.isUserInteractionEnabled
        
        let expectedViewIsUserInteractionEnabled = false
        XCTAssert(viewIsUserInteractionEnabled == expectedViewIsUserInteractionEnabled, "AUIEmptyViewController does not set isUserInteractionEnabled for setting UIView.")
    }
    
    func testSettingViewIsUserInteractionEnabledAfterSettingView() {
        let view = UIView()
        let viewController = AUIEmptyViewController()
        
        viewController.view = view
        viewController.isUserInteractionEnabled = false
        let viewIsUserInteractionEnabled = view.isUserInteractionEnabled
        
        let expectedViewIsUserInteractionEnabled = false
        XCTAssert(viewIsUserInteractionEnabled == expectedViewIsUserInteractionEnabled, "AUIEmptyViewController does not set isUserInteractionEnabled for setted UIView.")
    }
    
    // MARK: Set isFirstResponder
    
    func testIsFirstResponderWithoutView() {
        let viewController = AUIEmptyViewController()
        
        let isFirstResponder = viewController.isFirstResponder
        
        let expectedIsFirstResponder = false
        XCTAssert(isFirstResponder == expectedIsFirstResponder, "AUIEmptyViewController without UIView can not be first responder.")
    }
    
    func testBecomeFirstResponderWithoutView() {
        let viewController = AUIEmptyViewController()
        
        let doesBecomeFirstResponder = viewController.becomeFirstResponder()
        
        let expectedDoesBecomeFirstResponder = false
        XCTAssert(doesBecomeFirstResponder == expectedDoesBecomeFirstResponder, "AUIEmptyViewController without UIView can not become first responder.")
    }
    
    func testResignFirstResponderWithoutView() {
        let viewController = AUIEmptyViewController()
        
        let doesResignFirstResponder = viewController.resignFirstResponder()
        
        let expectedDoesResignFirstResponder = false
        XCTAssert(doesResignFirstResponder == expectedDoesResignFirstResponder, "AUIEmptyViewController without UIView can not resign first responder.")
    }
    
    private class TestUIView: UIView {
        
        var isGetterIsFirstResponderCalled = false
        override var isFirstResponder: Bool {
            let isFirstResponder = super.isFirstResponder
            isGetterIsFirstResponderCalled = true
            return isFirstResponder
        }
        
        var isMethodBecomeFirstResponderCalled = false
        override func becomeFirstResponder() -> Bool {
            let becomeFirstResponder = super.becomeFirstResponder()
            isMethodBecomeFirstResponderCalled = true
            return becomeFirstResponder
        }
        
        var isMethodResignFirstResponderCalled = false
        override func resignFirstResponder() -> Bool {
            let resignFirstResponder = super.becomeFirstResponder()
            isMethodResignFirstResponderCalled = true
            return resignFirstResponder
        }
        
    }
    
    func testIsFirstResponderWithView() {
        let view = TestUIView()
        let viewController = AUIEmptyViewController()
        viewController.view = view
        
        let _ = viewController.isFirstResponder
        let isGetterIsFirstResponderCalled = view.isGetterIsFirstResponderCalled
        
        XCTAssert(isGetterIsFirstResponderCalled, "AUIEmptyViewController has to call UIView getter `isFirstResponder`.")
    }
    
    func testBecomeFirstResponderWithView() {
        let view = TestUIView()
        let viewController = AUIEmptyViewController()
        viewController.view = view
        
        viewController.becomeFirstResponder()
        let isMethodBecomeFirstResponderCalled = view.isMethodBecomeFirstResponderCalled
        
        XCTAssert(isMethodBecomeFirstResponderCalled, "AUIEmptyViewController has to call UIView method `resignFirstResponder()`.")
    }
    
    func testResignFirstResponderWithView() {
        let view = TestUIView()
        let viewController = AUIEmptyViewController()
        viewController.view = view
        
        viewController.resignFirstResponder()
        let isMethodResignFirstResponderCalled = view.isMethodResignFirstResponderCalled
        
        XCTAssert(isMethodResignFirstResponderCalled, "AUIEmptyViewController has to call UIView method `resignFirstResponder()`.")
    }
    
    
}
