//
//  TestePostCardCollectionViewCell.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 24/07/24.
//

import UIKit

class TestPostCardCollectionViewCell: UICollectionViewCell {
    
    private var screen: TestPostCardCollectionViewScreen = TestPostCardCollectionViewScreen()
    
    private var viewModel: TestPostCardViewModel?
    
    static let identifier: String = "TestPostCardCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsScreen()
        screen.settingsProtocolCollectionView(delegate: self, dataSource: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsScreen() {
        
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
        
    }
    
    public func setupCell(listPost: [Posts]) {
        
        viewModel = TestPostCardViewModel(listPost: listPost)
        
    }
    
    
}

extension TestPostCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.numberOfItems ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestPostCollectionViewCell.identifier, for: indexPath) as? TestPostCollectionViewCell
        
        cell?.setupCell(data: viewModel.loadCurrentPost(indexPath: indexPath), indexPath: indexPath)
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: collectionView.frame.width, height: 400)
        
    }
    
}
