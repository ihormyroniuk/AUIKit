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
    
    func testSettingView() {
        let view = UIView()
        let viewController = AUIEmptyViewController()
        
        viewController.view = view
        let actualView = viewController.view
        
        let expectedView = view
        XCTAssert(actualView == expectedView, "Actual view isUserInteractionEnabled [\(String(describing: actualView))] is not equal to [\(expectedView)]")
    }
    
    func testIsFirstResponderWithView() {
        let view = UIView()
        let viewController = AUIEmptyViewController()
        
        viewController.view = view
        let actualIsFirstResponder = viewController.isFirstResponder
        
        let expectedIsFirstResponder = view.isFirstResponder
        XCTAssert(actualIsFirstResponder == expectedIsFirstResponder, "Actual isFirstResponder [\(String(describing: actualIsFirstResponder))] is not equal to [\(expectedIsFirstResponder)]")
    }
    
    func testIsFirstResponderWithNilView() {
        let view: UIView? = nil
        let viewController = AUIEmptyViewController()
        
        viewController.view = view
        let actualIsFirstResponder = viewController.isFirstResponder
        
        let expectedIsFirstResponder = view?.isFirstResponder ?? false
        XCTAssert(actualIsFirstResponder == expectedIsFirstResponder, "Actual isFirstResponder [\(String(describing: actualIsFirstResponder))] is not equal to [\(expectedIsFirstResponder)]")
    }
    
    func testIsFirstResponderWithViewAfterBecomeFirstResponder() {
        let view = TestUIView()
        let viewController = AUIEmptyViewController()
        
        viewController.view = view
        let actualIsFirstResponder = viewController.becomeFirstResponder()
        
        let expectedIsFirstResponder = true
        XCTAssert(actualIsFirstResponder == expectedIsFirstResponder, "Actual isFirstResponder [\(String(describing: actualIsFirstResponder))] is not equal to [\(expectedIsFirstResponder)]")
    }
    
    func testIsFirstResponderWithViewAfterResignFirstResponder() {
        let view = TestUIView()
        let viewController = AUIEmptyViewController()
        
        viewController.view = view
        let actualIsFirstResponder = viewController.resignFirstResponder()
        
        let expectedIsFirstResponder = true
        XCTAssert(actualIsFirstResponder == expectedIsFirstResponder, "Actual isFirstResponder [\(String(describing: actualIsFirstResponder))] is not equal to [\(expectedIsFirstResponder)]")
    }
    
    func testIsFirstResponderWithNilViewAfterBecomeFirstResponder() {
        let view: UIView? = nil
        let viewController = AUIEmptyViewController()
        
        viewController.view = view
        let actualIsFirstResponder = viewController.becomeFirstResponder()
        
        let expectedIsFirstResponder = false
        XCTAssert(actualIsFirstResponder == expectedIsFirstResponder, "Actual isFirstResponder [\(String(describing: actualIsFirstResponder))] is not equal to [\(expectedIsFirstResponder)]")
    }
    
    func testIsFirstResponderWithNilViewAfterResignFirstResponder() {
        let view: UIView? = nil
        let viewController = AUIEmptyViewController()
        
        viewController.view = view
        let actualIsFirstResponder = viewController.resignFirstResponder()
        
        let expectedIsFirstResponder = true
        XCTAssert(actualIsFirstResponder == expectedIsFirstResponder, "Actual isFirstResponder [\(String(describing: actualIsFirstResponder))] is not equal to [\(expectedIsFirstResponder)]")
    }

    func testSettingViewIsUserInteractionEnabledTrueBeforeSettingView() {
        let view = UIView()
        let viewController = AUIEmptyViewController()
        
        viewController.isUserInteractionEnabled = true
        viewController.view = view
        let actualViewIsUserInteractionEnabled = view.isUserInteractionEnabled
        
        let expectedViewIsUserInteractionEnabled = true
        XCTAssert(actualViewIsUserInteractionEnabled == expectedViewIsUserInteractionEnabled, "Actual view isUserInteractionEnabled [\(String(describing: actualViewIsUserInteractionEnabled))] is not equal to [\(expectedViewIsUserInteractionEnabled)]")
    }
    
    func testSettingViewIsUserInteractionEnabledTrueAfterSettingView() {
        let view = UIView()
        let viewController = AUIEmptyViewController()
        
        viewController.view = view
        viewController.isUserInteractionEnabled = true
        let actualViewIsUserInteractionEnabled = view.isUserInteractionEnabled
        
        let expectedViewIsUserInteractionEnabled = true
        XCTAssert(actualViewIsUserInteractionEnabled == expectedViewIsUserInteractionEnabled, "Actual view isUserInteractionEnabled [\(String(describing: actualViewIsUserInteractionEnabled))] is not equal to [\(expectedViewIsUserInteractionEnabled)]")
    }
    
}

private class TestUIView: UIView {
    
    private var testIsFirstResponder: Bool = false
    
    override var isFirstResponder: Bool {
        return testIsFirstResponder
    }
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        testIsFirstResponder = true
        return testIsFirstResponder
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        testIsFirstResponder = false
        return true
    }
    
}
