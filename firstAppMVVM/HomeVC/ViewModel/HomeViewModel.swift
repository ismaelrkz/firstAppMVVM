//
//  HomeViewModel.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 26/06/24.
//

import UIKit

class HomeViewModel {
    
    // array privado com os dados dos Stories
    private var Story = [
    
    Stories(image: "img1", userName: "Add Story"),
    Stories(image: "img2", userName: "Jack"),
    Stories(image: "img3", userName: "Carolina"),
    Stories(image: "img4", userName: "Samuel"),
    Stories(image: "img5", userName: "Ariana"),
    Stories(image: "img6", userName: "Puggy"),
    Stories(image: "img7", userName: "Dheera"),
    
    ]
    
    // array público encapsulado para acesso fora da classe
    // { ... } -> getter implícito é um bloco de código que retorna um valor
    // nesse caso o valor é a propriedade Story que é do tipo Stories
    public var getListStory: [Stories] { Story }
    
    public var numberOfItems: Int { return 1 } //será configurado um array aqui posteriormente???
    
    // O indexPath: IndexPath é um índice que representa a posição do item dentro da coleção.
    // O frame: CGRect é um retângulo que representa a área disponível para o item.
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        // Verifica se o item está na primeira posição (índice 0) da coleção.
        if indexPath.row == 0 {
            // Se for o primeiro item, retorna um tamanho fixo de 120 de largura e a altura completa do frame.
            return CGSize(width: 120, height: frame.height)
        // Para todos os outros itens (índice diferente de 0):
        } else {
            // Retorna um tamanho onde a largura é a largura total do frame menos 120 e a altura é a altura completa do frame.
            return CGSize(width: frame.width - 120, height: frame.height)
            
        }
        
    }
    
}
