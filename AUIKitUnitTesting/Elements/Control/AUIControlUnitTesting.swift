import XCTest
import AUIKit

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
