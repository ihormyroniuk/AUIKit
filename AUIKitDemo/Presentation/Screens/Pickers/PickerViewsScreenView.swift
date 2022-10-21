import AUIKit

extension PickerViewsScreenViewController {
class ScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: - Subviews
    
    let titlePickerView = UIPickerView()
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(titlePickerView)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTitlePickerView()
    }
    
    private func layoutTitlePickerView() {
        let x: CGFloat = 0
        let y = navigationBarView.frame.maxY
        let width = bounds.width
        let height = titlePickerView.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude)).height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        titlePickerView.frame = frame
    }
        
}
}
