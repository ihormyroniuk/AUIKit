//
//  CollectionViewScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 12.02.2022.
//

import AUIKit

class CollectionViewScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: Subviews
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    let collectionView: UICollectionView
    
    // MARK: Initializer
    
    init() {
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        super.init()
    }
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(collectionView)
        setupCollectionView()
    }
    
    private let collectionViewCellReuseIdentifier = "collectionViewCellReuseIdentifier"
    private func setupCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellReuseIdentifier)
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
        let height: CGFloat = bounds.height - y
        let frame = CGRect(x: x, y: y, width: width, height: height)
        collectionView.frame = frame
        collectionViewFlowLayout.minimumInteritemSpacing = 5
    }
    
    // MARK: Cells
    
    func collectionViewCell(_ indexPath: IndexPath) -> CollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellReuseIdentifier, for: indexPath) as! CollectionViewCell
        return collectionViewCell
    }
    
    func collectionViewCellSize() -> CGSize {
        let width = bounds.width
        let height: CGFloat = 64
        return CGSize(width: width, height: height)
    }
}

class CollectionViewCell: AUICollectionViewCell {
    
    // MARK: Subview
    
    let textLabel = UILabel()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        contentView.addSubview(textLabel)
        backgroundColor = .green
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTextLabel()
    }
    
    private func layoutTextLabel() {
        textLabel.frame = contentView.bounds
        textLabel.textAlignment = .center
    }
    
}
