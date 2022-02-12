//
//  MenuScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 09.08.2020.
//

import AUIKit

class MenuScreenView: TitleLabelScreenView {
    
    // MARK: Subviews
    
    let collectionViewLayout = UICollectionViewFlowLayout()
    let collectionView: UICollectionView
    
    // MARK: Initializer
    
    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        super.init()
    }
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(collectionView)
        setupCollectionView()
    }
    
    private let menuItemCollectionViewCellIdentifier = "menuItemCollectionViewCellIdentifier"
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(MenuItemCollectionViewCell.self, forCellWithReuseIdentifier: menuItemCollectionViewCellIdentifier)
        collectionView.alwaysBounceVertical = true
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutCollectionView()
    }
    
    private func layoutCollectionView() {
        let x: CGFloat = 0
        let y = navigationBarView.frame.origin.y + navigationBarView.frame.size.height
        let width = bounds.width
        let height = bounds.height - y
        let frame = CGRect(x: x, y: y, width: width, height: height)
        collectionView.frame = frame
    }
    
    // MARK: Cells
    
    func menuItemCollectionViewCell(indexPath: IndexPath) -> MenuItemCollectionViewCell {
        let cell: MenuItemCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: menuItemCollectionViewCellIdentifier, for: indexPath) as? MenuItemCollectionViewCell
        return cell
    }
    
    func menuItemCollectionViewCellSize() -> CGSize {
        return CGSize(width: bounds.size.width - 20 * 2, height: 40)
    }
    
    
}

class MenuItemCollectionViewCell: AUICollectionViewCell {
    
    // MARK: Subviews
    
    let titleLabel = UILabel()
    let rightArrowImageView = UIImageView()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        addSubview(titleLabel)
        setupTitleLabel()
        addSubview(rightArrowImageView)
        setupRightArrowImageView()
    }
    
    private func setupTitleLabel() {
        
    }
    
    private func setupRightArrowImageView() {
        rightArrowImageView.contentMode = .scaleAspectFit
        rightArrowImageView.tintColor = .black
        if #available(iOS 13.0, *) {
            rightArrowImageView.image = UIImage(systemName: "arrow.right.circle.fill")
        }
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = layoutTitleLabel(boundsSize: bounds.size)
        rightArrowImageView.frame = layoutRightArrowImageView(boundsSize: bounds.size)
    }
    
    private func layoutTitleLabel(boundsSize: CGSize) -> CGRect {
        let x: CGFloat = 0
        let y: CGFloat = 0
        let width = boundsSize.width - 40 - 4
        let height: CGFloat = 40
        let frame = CGRect(x: x, y: y, width: width, height: height)
        return frame
    }
    
    private func layoutRightArrowImageView(boundsSize: CGSize) -> CGRect {
        let height: CGFloat = 40
        let width = height
        let x = boundsSize.width - width
        let y: CGFloat = 0
        let frame = CGRect(x: x, y: y, width: width, height: height)
        return frame
    }
    
}
