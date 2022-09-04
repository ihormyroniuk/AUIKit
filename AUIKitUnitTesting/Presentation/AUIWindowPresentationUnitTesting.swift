import XCTest
import AUIKit

class AUIWindowPresentationUnitTesting: XCTestCase {
    
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
