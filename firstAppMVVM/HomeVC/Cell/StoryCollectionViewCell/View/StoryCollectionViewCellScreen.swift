//
//  StoryCollectionViewCellScreen.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 11/07/24.
//

import UIKit

class StoryCollectionViewCellScreen: UIView {

    lazy var profileImageView: UIImageView = {
        
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    lazy var addButton: UIButton = {
        
        let button = UIButton() // testar as propriedades com outros valores
        // withRenderingMode -> definindo como alwaysTemplate toda a área opaca será preenchida pela cor de tintColor.
        button.setBackgroundImage(UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = .blue
        button.backgroundColor = .white
        button.layer.cornerRadius = 12.5

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()

    
    lazy var userNameLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        settingsConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        
        addSubview(profileImageView)
        addSubview(addButton)
        addSubview(userNameLabel)
        
    }
    
    private func settingsConstraints(){
        
        NSLayoutConstraint.activate([
        
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            
            addButton.widthAnchor.constraint(equalToConstant: 25),
            addButton.heightAnchor.constraint(equalToConstant: 25),
            addButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            addButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
        ])
        
    }
    
}
