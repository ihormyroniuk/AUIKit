import XCTest
import AUIKit

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
    
    func testAddDidTouchDownObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        
        viewController.control = control
        var isMethodControlControllerDidTouchDownCalled = false
        viewController.touchDown = {
            isMethodControlControllerDidTouchDownCalled = true
        }
        viewController.controlTouchDownEventAction()
        
        XCTAssert(isMethodControlControllerDidTouchDownCalled, "AUIControlControllerDidTouchDownObserver is not notified after subscribe.")
    }
    
    func testRemoveDidTouchDownObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        
        viewController.control = control
        var isMethodControlControllerDidTouchDownCalled = false
        viewController.touchDown = {
            isMethodControlControllerDidTouchDownCalled = true
        }
        viewController.touchDown = nil
        viewController.controlTouchDownEventAction()
        
        XCTAssert(!isMethodControlControllerDidTouchDownCalled, "AUIControlControllerDidTouchDownObserver is notified after unsubscribe.")
    }
    
    func testAddDidTouchUpInsideObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        
        viewController.control = control
        var isMethodControlControllerDidTouchUpInsideCalled = false
        viewController.touchUpInside = {
            isMethodControlControllerDidTouchUpInsideCalled = true
        }
        viewController.controlTouchUpInsideEventAction()
        
        XCTAssert(isMethodControlControllerDidTouchUpInsideCalled, "AUIControlControllerDidTouchUpInsideObserver is not notified after subscribe.")
    }
    
    func testRemoveDidTouchUpInsideObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        
        viewController.control = control
        var isMethodControlControllerDidTouchUpInsideCalled = false
        viewController.touchUpInside = {
            isMethodControlControllerDidTouchUpInsideCalled = true
        }
        viewController.touchUpInside = nil
        viewController.controlTouchUpInsideEventAction()
        
        XCTAssert(!isMethodControlControllerDidTouchUpInsideCalled, "AUIControlControllerDidTouchUpInsideObserver is notified after unsubscribe.")
    }
    
    func testAddDidTouchUpOutsideObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        
        viewController.control = control
        var isMethodControlControllerDidTouchUpOutsideCalled = false
        viewController.touchUpOutside = {
            isMethodControlControllerDidTouchUpOutsideCalled = true
        }
        viewController.controlTouchUpOutsideEventAction()
        
        XCTAssert(isMethodControlControllerDidTouchUpOutsideCalled, "AUIControlControllerDidTouchUpOutsideObserver is not notified after subscribe.")
    }
    
    func testRemoveDidTouchUpOutsideObserver() {
        let control = UIButton()
        let viewController = AUIEmptyControlController()
        
        viewController.control = control
        var isMethodControlControllerDidTouchUpOutsideCalled = false
        viewController.touchUpOutside = {
            isMethodControlControllerDidTouchUpOutsideCalled = true
        }
        viewController.touchUpOutside = nil
        viewController.controlTouchUpOutsideEventAction()
        
        XCTAssert(!isMethodControlControllerDidTouchUpOutsideCalled, "AUIControlControllerDidTouchUpOutsideObserver is notified after unsubscribe.")
    }
    
}
