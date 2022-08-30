//
//  AUIEmptyControlControllerUnitTesting.swift
//  AUIKitUnitTesting
//
//  Created by Ihor Myroniuk on 06.08.2020.
//

import XCTest
import AUIKit
import UIKit

class AUIEmptyControlControllerUnitTesting: XCTestCase {

    // MARK: Set isEnabled
    
    func testSettingViewIsUserInteractionEnabledBeforeSettingView() {
        let control = UIControl()
        let viewController = AUIEmptyControlController()
        
        viewController.isEnabled = false
        viewController.control = control
        let controlIsEnabled = control.isEnabled
        
        let expectedViewIsUserInteractionEnabled = false
        XCTAssert(controlIsEnabled == expectedViewIsUserInteractionEnabled, "AUIEmptyViewController does not set isEnabled for setting UIControl.")
    }
    
    func testSettingViewIsUserInteractionEnabledAfterSettingView() {
        let control = UIControl()
        let viewController = AUIEmptyControlController()
        
        viewController.control = control
        viewController.isEnabled = false
        let controlIsEnabled = control.isEnabled
        
        let expectedViewIsUserInteractionEnabled = false
        XCTAssert(controlIsEnabled == expectedViewIsUserInteractionEnabled, "AUIEmptyViewController does not set isEnabled for setted UIControl.")
    }
    
    // MARK: Observers
    
    private class TestAUIControlControllerDidTouchDownObserver: AUIControlControllerDidTouchDownObserver {
        var isMethodControlControllerDidTouchDownCalled = false
        func controlControllerDidTouchDown(_ controlController: AUIControlController) {
            isMethodControlControllerDidTouchDownCalled = true
        }
    }
    
    func testAddDidTouchDownObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        let observer = TestAUIControlControllerDidTouchDownObserver()
        
        viewController.control = control
        viewController.addDidTouchDownObserver(observer)
        viewController.controlTouchDownEventAction()
        let isMethodControlControllerDidTouchDownCalled = observer.isMethodControlControllerDidTouchDownCalled
        
        XCTAssert(isMethodControlControllerDidTouchDownCalled, "AUIControlControllerDidTouchDownObserver is not notified after subscribe.")
    }
    
    func testRemoveDidTouchDownObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        let observer = TestAUIControlControllerDidTouchDownObserver()
        
        viewController.control = control
        viewController.addDidTouchDownObserver(observer)
        viewController.removeDidTouchDownObserver(observer)
        viewController.controlTouchDownEventAction()
        let isMethodControlControllerDidTouchDownCalled = observer.isMethodControlControllerDidTouchDownCalled
        
        XCTAssert(!isMethodControlControllerDidTouchDownCalled, "AUIControlControllerDidTouchDownObserver is notified after unsubscribe.")
    }
    
    private class TestAUIControlControllerDidTouchUpInsideObserver: AUIControlControllerDidTouchUpInsideObserver {
        var isMethodControlControllerDidTouchUpInsideCalled = false
        func controlControllerDidTouchUpInside(_ controlController: AUIControlController) {
            isMethodControlControllerDidTouchUpInsideCalled = true
        }
    }
    
    func testAddDidTouchUpInsideObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        let observer = TestAUIControlControllerDidTouchUpInsideObserver()
        
        viewController.control = control
        viewController.addDidTouchUpInsideObserver(observer)
        viewController.controlTouchUpInsideEventAction()
        let isMethodControlControllerDidTouchUpInsideCalled = observer.isMethodControlControllerDidTouchUpInsideCalled
        
        XCTAssert(isMethodControlControllerDidTouchUpInsideCalled, "AUIControlControllerDidTouchUpInsideObserver is not notified after subscribe.")
    }
    
    func testRemoveDidTouchUpInsideObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        let observer = TestAUIControlControllerDidTouchUpInsideObserver()
        
        viewController.control = control
        viewController.addDidTouchUpInsideObserver(observer)
        viewController.removeDidTouchUpInsideObserver(observer)
        viewController.controlTouchUpInsideEventAction()
        let isMethodControlControllerDidTouchUpInsideCalled = observer.isMethodControlControllerDidTouchUpInsideCalled
        
        XCTAssert(!isMethodControlControllerDidTouchUpInsideCalled, "AUIControlControllerDidTouchUpInsideObserver is notified after unsubscribe.")
    }
    
    private class TestAUIControlControllerDidTouchUpOutsideObserver: AUIControlControllerDidTouchUpOutsideObserver {
        var isMethodControlControllerDidTouchUpOutsideCalled = false
        func controlControllerDidTouchUpOutside(_ controlController: AUIControlController) {
            isMethodControlControllerDidTouchUpOutsideCalled = true
        }
    }
    
    func testAddDidTouchUpOutsideObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        let observer = TestAUIControlControllerDidTouchUpOutsideObserver()
        
        viewController.control = control
        viewController.addDidTouchUpOutsideObserver(observer)
        viewController.controlTouchUpOutsideEventAction()
        let isMethodControlControllerDidTouchUpOutsideCalled = observer.isMethodControlControllerDidTouchUpOutsideCalled
        
        XCTAssert(isMethodControlControllerDidTouchUpOutsideCalled, "AUIControlControllerDidTouchUpOutsideObserver is not notified after subscribe.")
    }
    
    func testRemoveDidTouchUpOutsideObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        let observer = TestAUIControlControllerDidTouchUpOutsideObserver()
        
        viewController.control = control
        viewController.addDidTouchUpOutsideObserver(observer)
        viewController.removeDidTouchUpOutsideObserver(observer)
        viewController.controlTouchUpOutsideEventAction()
        let isMethodControlControllerDidTouchUpOutsideCalled = observer.isMethodControlControllerDidTouchUpOutsideCalled
        
        XCTAssert(!isMethodControlControllerDidTouchUpOutsideCalled, "AUIControlControllerDidTouchUpOutsideObserver is notified after unsubscribe.")
    }
    
}
