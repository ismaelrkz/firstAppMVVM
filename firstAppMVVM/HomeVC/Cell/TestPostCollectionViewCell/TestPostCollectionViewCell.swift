//
//  TestPostCollectionViewCollectionViewCell.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 24/07/24.
//

import UIKit

class TestPostCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TestPostCardCollectionViewCell"
    
    private var screen: TestPostCollectionViewScreen = TestPostCollectionViewScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsScreen()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsScreen(){
        
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
        
    }

    
    public func setupCell(data: Posts, indexPath: IndexPath) {

        screen.profileImageView.image = UIImage(named: data.userImage)
        screen.postImageView.image = UIImage(named: data.imagePost)
        screen.userNameLabel.text = data.userName
        
    }
        
}
