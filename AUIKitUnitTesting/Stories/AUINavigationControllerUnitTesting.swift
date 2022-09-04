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
    
}
