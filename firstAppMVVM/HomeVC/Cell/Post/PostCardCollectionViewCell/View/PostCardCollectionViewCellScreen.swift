//
//  PostCardCollectionViewCellScreen.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 07/08/24.
//

import UIKit

class PostCardCollectionViewCellScreen: UIView {
    
    lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout() //por que instanciar?
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        return cv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        settingsConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func settingsProtocolsCollectionViewCell(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
    }
    
    private func addElements() {
        
        addSubview(collectionView)
        
    }
    
    private func settingsConstraints() {
        
        collectionView.pin(to: self)
        
    }
    
}
