//
//  HomeScreen.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 18/06/24.
//

import UIKit
// View (mvvm)
class HomeScreen: UIView {
    
    
    lazy var collectionView: UICollectionView = {
        // Inicializa a instância da UICollectionViewFlowLayout para configurar o layout da collection.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // direção da rolagem da collection.
        layout.scrollDirection = .horizontal
        // frame: .zero -> defini sua posição como zero (não será visível na tela) *é preciso configurar sua posição manualmente.
        // collectionViewLayout: layout -> parâmetro é usado para definir o layout da coleção, que controla como os itens dentro da UICollectionView são organizados e exibidos.
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // translatesAutoresizingMaskIntoConstraints definida como false irá permitir o uso de autoLayout das constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor.clear // testeTeste
        
        // definimos .self para informar o tipo da classe
        cv.register(StoryCardCollectionViewCell.self, forCellWithReuseIdentifier: StoryCardCollectionViewCell.identifier)
        
        return cv
        
    }()
    //método responsável pela assinatura dos protocolos na camada Model (MVVM) *chamar método na classe HomeVC.
    public func settingsProtocolCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        collectionView.delegate = delegate // responsável pela interação do usuário.
        collectionView.dataSource = dataSource // responsável por fornecer os dados.
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        settingsConstraints()
        
        backgroundColor = UIColor.appBackGround // definindo o background da HomeScreen
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // método responsável por adicionar os elementos na camada View (MVVM).
    private func addElements(){
        
        addSubview(collectionView)
        
    }
    // método responsável por configurar as constraints dos elementos.
    private func settingsConstraints(){
        // definindo como self ocupará toda a área da HomeScreen
        collectionView.pin(to: self)
        
    }
    
}
