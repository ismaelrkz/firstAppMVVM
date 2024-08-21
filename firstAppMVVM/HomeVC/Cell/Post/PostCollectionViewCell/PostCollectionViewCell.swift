//
//  PostCollectionViewCell.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 15/08/24.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PostCollectionViewCell"
    
    private var screen: PostCollectionViewCellScreen = PostCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        settingsScreen()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsScreen(){
        
        screen.translatesAutoresizingMaskIntoConstraints = false// auto layout
        contentView.addSubview(screen)// contentView é a principal view da célula. Chamando a screen, à definimos como a view principal.
        screen.pin(to: contentView) // o método pin irá configurar a área ocupada dentro da contentView.
    
    }
    
    public func setupCell(data: Posts) {
        
        screen.profileImageView.image = UIImage(named: data.profileImage)
        screen.userNameLabel.text = data.userName
        screen.postImageView.image = UIImage(named: data.postImage)
        
    }
    
}
