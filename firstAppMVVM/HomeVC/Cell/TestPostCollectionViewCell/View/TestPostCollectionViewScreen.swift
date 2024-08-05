//
//  TestPostCollectionViewScreen.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 26/07/24.
//

import UIKit

class TestPostCollectionViewScreen: UIView {

    lazy var postView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.setCardShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    lazy var profileImageView: UIImageView = {
        
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    lazy var userNameLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    lazy var postImageView: UIImageView = {
        
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
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
        
        addSubview(postView)
        postView.addSubview(profileImageView)
        postView.addSubview(userNameLabel)
        postView.addSubview(postImageView)
        
    }
    
    private func settingsConstraints(){

        NSLayoutConstraint.activate([
            
            postView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            postView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            postView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            postView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            userNameLabel.heightAnchor.constraint(equalToConstant: 15),
            userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            
            postImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 15),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        
        ])
        
    }
    
}
