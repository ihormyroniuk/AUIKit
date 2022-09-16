import UIKit

open class AUIAutoLayoutBottomAlignedContentViewScrollView: AUIAutoLayoutScrollView {
    
    // MARK: - Componenets
    
    public let contentAlignmentView = UIView()
    public let contentView = UIView()
    
    // MARK: - Setup
    
    override open func setup() {
        super.setup()
        addSubview(contentAlignmentView)
        setupContentAlignmentView()
        contentAlignmentView.addSubview(contentView)
        setupContentView()
    }
    
    open func setupContentAlignmentView() {
        contentAlignmentView.backgroundColor = .clear
    }
    
    open func setupContentView() {
        contentView.backgroundColor = .clear
    }
    
    // MARK: - AutoLayout
    
    override open func autoLayout() {
        super.autoLayout()
        autoLayoutContentAlignmentView()
        autoLayoutContentView()
    }
  
    open func autoLayoutContentAlignmentView() {
        contentAlignmentView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            NSLayoutConstraint(item: contentAlignmentView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentAlignmentView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentAlignmentView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentAlignmentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentAlignmentView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentAlignmentView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        ])
    }
  
    open func autoLayoutContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        contentAlignmentView.addConstraints([
            NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: contentAlignmentView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: contentAlignmentView, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: contentAlignmentView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: contentAlignmentView, attribute: .top, multiplier: 1, constant: 0),
        ])
    }
  
}
