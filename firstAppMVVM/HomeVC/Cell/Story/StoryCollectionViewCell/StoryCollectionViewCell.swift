//
//  StoryCollectionViewCell.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 11/07/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCollectionViewCell"
    // instância de StoryCollectionViewCell
    private var screen: StoryCollectionViewCellScreen = StoryCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsScreen()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // método que configura a view.
    // inclusive tornando a StoryCollectionViewCellScreen como view principal (contentView).
    private func settingsScreen(){
        
        screen.translatesAutoresizingMaskIntoConstraints = false// auto layout
        contentView.addSubview(screen)// contentView é a principal view da célula. Chamando a screen, à definimos como a view principal.
        screen.pin(to: contentView) // o método pin irá configurar a área ocupada dentro da contentView.
    
    }
    // este método configura uma célula de exibição UICollectionViewCell com os dados fornecidos e ajusta a visibilidade de um botão com base na posição da célula no indexPath.
    public func setupCell(data: Stories, indexPath: IndexPath) {
        // Atribui as propriedades do objeto data aos elementos profileImageView e userNameLabel.
        // Atribuímos o nome da imagem e do usuário aos elementos.
        screen.profileImageView.image = UIImage(named: data.image)
        screen.userNameLabel.text = data.userName
        // a linha abaixo controla a visibilidade do botão addButton.
        // indexPath representa a posição da célula.
        // "indexPath.row == 0" verifica se a célula é a primeira.
        // "indexPath.row == 0 ? false : true" é uma forma compacta de um if-else.
        // Esta funcionalidade deixará visível o botão apenas na primeira célula.
        screen.addButton.isHidden = indexPath.row == 0 ? false : true
    }

    
}
