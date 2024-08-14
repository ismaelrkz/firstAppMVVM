//
//  StoryCardCollectionViewCell.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 29/06/24.
//

import UIKit

class StoryCardCollectionViewCell: UICollectionViewCell {
    
//    var homeViewModel: HomeViewModel = HomeViewModel() // por qual motivo temos essa instância aqui?
    
    private var screen: StoryCardCollectionViewCellScreen = StoryCardCollectionViewCellScreen()
    
    private var viewModel: StoryCardViewModel?
    
    static let identifier: String = "StoryCardCollectionViewCell" // identificador da célula.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsScreen()
        // self nesse contexto se refere a instância atual "StoryCardCollectionViewCell" que irá atuar nos parâmetros do método.
        screen.settingsProtocolCollectionView(delegate: self, dataSource: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsScreen(){
        
        screen.translatesAutoresizingMaskIntoConstraints = false// auto layout
        contentView.addSubview(screen) // contentView é a principal view da célula. Chamando a screen, à definimos como a view principal.
        screen.pin(to: contentView) // o método pin irá configurar a área ocupada dentro da contentView.
        
    }
    // o método abaixo chama a instância de StoryCardViewModel, onde seu construtor é o Objeto Stories.
    // o objeto Stories é responsável por definir o tipo de dado contido no array que contêm os dados.
    // quando atribuímos o método na célula na HomeVC, o método irá esperar como parâmetro um array do tipo Stories.
    public func setupCell(listStory: [Stories]) {
        // inicializador da instância de StoryCardViewModel.
        // a classe StoryCardViewModel precisa conter um init com um parâmetro do tipo [Stories].
        viewModel = StoryCardViewModel(listStory: listStory)
        
    }
    
}

extension StoryCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // chamada do método que irá definir a quantia de células baseada no indexPath do array.
        return viewModel?.numberOfItems ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // guard let é uma estrutura de controle para verificar se uma propriedade contêm algum valor ou se é nil.
        // assim retiramos a opcionalidade da instância viewModel.
        // declaramos e inicializamos o array de dados em viewModel.
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        // a constante abaixo irá armazenar os valores dos parâmetros (identifier & indexPath) do método dequeueReusableCell.
        // dequeueReusableCell reutiliza a célula que já esta na memória.
        // em seguida fará um cast opcional para converter o valor passado no método, caso tenha sucesso esse valor é armazenado na constante cell.
        // isso fará com que tenhamos acesso as propriedades e métodos da classe StoryCollectionViewCell.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell
        // abaixo o operador de coalescência (?) chama o método setupCell somente se cell não for nil.
        // setupCell(data: Stories... -> irá fornecer os dados que serão exibidos na tela.
        // loadCurrentStory(indexPath: indexPath) -> acessa de forma individual e única cada cell.
        // setupCell(...indexPath: indexPath) -> irá especificar a posição da célula na UICollectionView.
        cell?.setupCell(data: viewModel.loadCurrentStory(indexPath: indexPath), indexPath: indexPath)

        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: collectionView.frame.width, height: 120) // cell configurada de forma fixa
        
    }
    
}
