//
//  PostCardCollectionViewCell.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 07/08/24.
//

import UIKit

class PostCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PostCardCollectionViewCell"
    
    private var screen: PostCardCollectionViewCellScreen = PostCardCollectionViewCellScreen()
    
    private var viewModel: PostCardViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsScreen()
        screen.settingsProtocolsCollectionViewCell(delegate: self, dataSource: self)
        
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
        
        viewModel = PostCardViewModel(listPosts: listPost)
        
    }
    
}

extension PostCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.numberOfItems ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell
        
        cell?.setupCell(data: viewModel.loadCurrentPost(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 450)
        
    }
}
