import AUIKit

class Application: AUIEmptyApplication {
    
    // MARK: Launching
    
    override func didFinishLaunching() {
        super.didFinishLaunching()
        presentation.startDisplay()
    }
    
    // MARK: Presentation
    
    private lazy var presentation: Presentation = {
        let window = self.window ?? UIWindow()
        self.window = window
        let presentation = Presentation(window: window)
        return presentation
    }()
    
}
