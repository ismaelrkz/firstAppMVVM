//
//  TestePostCardCollectionViewScreen.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 24/07/24.
//

import UIKit

class TestPostCardCollectionViewScreen: UIView {
 
    lazy var cardView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.clear
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = UIColor.clear
        cv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        cv.register(TestPostCollectionViewCell.self, forCellWithReuseIdentifier: TestPostCollectionViewCell.identifier)
        
        return cv
        
    }()
    
    public func settingsProtocolCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        settingsConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        
        addSubview(cardView)
        cardView.addSubview(collectionView)
        
    }
    
    private func settingsConstraints(){
        
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
        ])

        collectionView.pin(to: cardView)
        
    }
    
}
