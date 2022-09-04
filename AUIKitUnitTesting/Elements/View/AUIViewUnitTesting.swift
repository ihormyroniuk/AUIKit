import XCTest
import AUIKit

class AUIViewUnitTesting: XCTestCase {
    
    // MARK: Call Method Setup
    
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
