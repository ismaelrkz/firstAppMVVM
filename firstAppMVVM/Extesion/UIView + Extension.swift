//
//  UIView + Extension.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 20/06/24.
//

import Foundation
import UIKit // necessário importar

// extensões permitem criar novas funcionalidades a uma classe já existente.
// não é necessário instanciar em outra classe para fazer seu uso.
extension UIView {
    // método que recebe uma label para a o parâmetro.
    // Este método fixa (ou "pina") a view atual à sua superView.
    func pin(to superView: UIView) {
        // Desabilitar esta propriedade permite que o Auto Layout gerencie as constraints.
        translatesAutoresizingMaskIntoConstraints = false
        // Ativa um conjunto de constraints de uma só vez para a view atual.
        NSLayoutConstraint.activate([
            // cada lado da tela é setado pelo parâmetro da superView
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            
        ])
        
    }
    
    func setCardShadow() {
        // configurações padrões para sombra.
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 8
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
    
    }
    
}
