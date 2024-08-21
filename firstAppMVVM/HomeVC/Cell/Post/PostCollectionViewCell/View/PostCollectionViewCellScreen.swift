//
//  PostCollectionViewCellScreen.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 15/08/24.
//

import UIKit

class PostCollectionViewCellScreen: UIView {
    
    lazy var cardView: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setCardShadow()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        
        return view
        
    }()
    
    lazy var likeImageView: UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "red-heart")
        image.contentMode = .scaleAspectFill
        // o target de UITapGestureRecognizer se refere a classe atual.
        // isso significa que o método reconhecido após o toque (tappedLikeImageView) está nessa mesma classe.
        //  O método deve estar marcado com @objc para ser exposto ao Objective-C runtime, que é necessário para que o gesture recognizer funcione.
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLikeImageView))
        
        tap.numberOfTapsRequired = 1
        
        image.addGestureRecognizer(tap)
        image.isUserInteractionEnabled = true
        image.isHidden = true
        
        return image
        
    }()
    
    @objc func tappedLikeImageView() {
        // nos parâmetros de animate:
        UIView.animate(withDuration: 0.5, // duração da animação
                       delay: 0, // velocidade em que a animação inicia.
                       usingSpringWithDamping: 0.9, // elasticidade da "mola".
                       initialSpringVelocity: 0, // velocidade inicial com que a "mola" aparece.
                       options: .curveEaseIn, // efeito da animação.
                       animations: {
            
            self.likeImageView.transform = .init(scaleX: 1.6, y: 1.6) // aumentamos sua escala.
            
        }, completion: { finished in
            
            self.likeImageView.isHidden = true // após a animação o elemento é escondido.
            self.likeImageView.transform = .identity // e volta a sua escala original.
            
        })
    }
    
    lazy var profileImageView: UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        
        return image
        
    }()
    
    lazy var userNameLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        return label
        
    }()
    
    lazy var postImageView: UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedPostImageView))
        
        tap.numberOfTapsRequired = 2
        
        image.addGestureRecognizer(tap)
        image.isUserInteractionEnabled = true
        
        return image
        
    }()
    
    @objc func tappedPostImageView() {
        
        heartImageView.isHidden = false // iniciamos trazendo a view do elemento.
        
        UIView.animate(withDuration: 0.8,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0,
                       options: .curveEaseIn,
                       animations: {
            
            // iniciar animação - white-heart
            
            self.heartImageView.transform = .init(scaleX: 1.8, y: 1.8) // transforma a imagem aumentando sua escala.
            self.postImageView.transform = .init(scaleX: 1.05, y: 1.05) // transforma a imagem aumentando sua escala (faz a imagem dar um "pulo").
            self.likeImageView.center.y += 50 // desloca o centro da imagem para baixo.
            
            
        }, completion: { finished in
            
            
            // finalizar animação
            // criamos aqui uma nova animação para "recolher" o like.
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                
                self.postImageView.transform = .identity // transforma a imagem em sua escala original.
                self.likeImageView.center.y -= 50 // desloca o centro da imagem para cima (voltando a posição original).
                self.likeImageView.isHidden = false
                
            })
            
            // quando a animação finaliza a imagem volta a sua escala original e fica escondida.
            self.heartImageView.transform = .identity
            self.heartImageView.isHidden = true
            
        })
        
    }
    
    lazy var heartImageView: UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "white-heart")
        image.contentMode = .scaleAspectFill
        image.isHidden = true
        
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
        
        addSubview(cardView)
        
        cardView.addSubview(likeImageView)
        cardView.addSubview(profileImageView)
        cardView.addSubview(userNameLabel)
        cardView.addSubview(postImageView)
        cardView.addSubview(heartImageView)
        
    }
    
    
    private func settingsConstraints(){
        
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            likeImageView.widthAnchor.constraint(equalToConstant: 25),
            likeImageView.heightAnchor.constraint(equalToConstant: 25),
            likeImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 19),
            likeImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            profileImageView.heightAnchor.constraint(equalToConstant: 30),
            profileImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 17),
            profileImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            
            userNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 24),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: likeImageView.leadingAnchor, constant: -5),
            
            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 17),
            postImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -7),
            postImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 7),
            postImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -7),
            
            heartImageView.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor),
            heartImageView.widthAnchor.constraint(equalToConstant: 70),
            heartImageView.heightAnchor.constraint(equalToConstant: 70),
            
        ])
        
    }
    
}
