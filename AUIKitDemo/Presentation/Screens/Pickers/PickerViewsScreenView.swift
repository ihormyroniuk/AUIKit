import AUIKit

extension PickerViewsScreenViewController {
class ScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: - Subviews
    
    let titlePickerView = UIPickerView()
    let viewPickerView = UIPickerView()
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        titlePickerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        addSubview(titlePickerView)
        
        viewPickerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        addSubview(viewPickerView)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTitlePickerView()
        layoutViewPickerView()
    }
    
    private func layoutTitlePickerView() {
        let x: CGFloat = 0
        let y = navigationBarView.frame.maxY
        let width = bounds.width
        let height = titlePickerView.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude)).height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        titlePickerView.frame = frame
    }
    
    private func layoutViewPickerView() {
        let x: CGFloat = 0
        let y = titlePickerView.frame.maxY + 16
        let width = bounds.width
        let height = titlePickerView.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude)).height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        viewPickerView.frame = frame
    }
        
}
}
