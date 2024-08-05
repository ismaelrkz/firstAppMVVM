//
//  StoryCardCollectionViewCellScreen.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 29/06/24.
//

import UIKit

class StoryCardCollectionViewCellScreen: UIView {
    
    lazy var cardView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.setCardShadow() //sombra do elemento
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    lazy var collectionView: UICollectionView = {
        // Inicializa-se a instância da UICollectionViewFlowLayout para configurar o layout da collection.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // direção da rolagem da collection.
        layout.scrollDirection = .vertical
        // frame: .zero -> defini sua posição como zero (não será visível na tela) *é preciso configurar sua posição manualmente.
        // collectionViewLayout: layout -> parâmetro é usado para definir o layout da coleção, que controla como os itens dentro da UICollectionView são organizados e exibidos.
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // translatesAutoresizingMaskIntoConstraints definida como false irá permitir o uso de autoLayout das constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = UIColor.clear
        // contentInset controla a distância das bordas dentro da view que o elemento está inserido
        cv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        
        cv.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        
        return cv
        
    }()
    // protocolos relacionados a collectionView dentro do elemento cardView *chamar na classe StoryCardCollectionViewCell
    public func settingsProtocolCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        collectionView.delegate = delegate // responsável pela interação do usuário.
        collectionView.dataSource = dataSource // responsável por fornecer os dados.
        
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
        // adicionamos a collectionView encima do cardView
        cardView.addSubview(collectionView)
        
    }
    
    private func settingsConstraints(){
        
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
        ])
        // atribuindo o método "pin" à collectionView iremos configurar as constraints conforme o método.
        // collectionView(childView) irá ficar por cima da cardView(parentView)
        collectionView.pin(to: cardView)
        
    }

}
