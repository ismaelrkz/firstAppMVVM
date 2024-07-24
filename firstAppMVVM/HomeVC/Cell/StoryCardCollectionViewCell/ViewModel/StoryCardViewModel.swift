//
//  StoryCardViewModel.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 04/07/24.
//

import UIKit

class StoryCardViewModel {
    // propriedade privada que irá armazenar a lista Stories
    // Stories é o tipo de dado armazenado (no caso uma Struct)
    private var listStory: [Stories]
    
    // inicializador obrigatório da classe.
    // StoryCardViewModel tem seu inicializador do tipo objeto Stories.
    // assim chamamos a instância de StoryCardViewModel dentro do método setupCell em StoryCardCollectionViewCell.
    // quando setupCell for chamada na HomeVC para popular a cell, o parâmetro do método irá ser um Objeto Stories.
    // então atribuímos o array getListStory, que é o encapsulamento do array.
    // esse array contém os dados da cell, esse array é construído com o tipo de dado do objeto Stories.
    init(listStory: [Stories]) {
        
        self.listStory = listStory
        
    }
    // propriedade que irá retornar o número de itens dentro do array listStory
    public var numberOfItems: Int { listStory.count }
    // método responsável por retornar um objeto Stories específico do array listStory com base no índice fornecido pelo indexPath.
    // o método irá 
    func loadCurrentStory(indexPath: IndexPath) -> Stories {
        
        listStory[indexPath.row]
        
    }
    
}
