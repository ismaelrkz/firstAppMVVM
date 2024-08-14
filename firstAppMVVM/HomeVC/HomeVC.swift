//
//  ViewController.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 15/06/24.
//

import UIKit
// model (mvvm)
class HomeVC: UIViewController {
    // propriedade opcional para armazenar a instância da HomeScreen
    private var homeScreen: HomeScreen?
    
    private var viewModel: HomeViewModel = HomeViewModel()
    
    // view principal configurada no loadView (prática recomendada para a view principal)
    // Método chamado quando a view do controlador está sendo carregada
    override func loadView() {
        // instanciação da HomeScreen
        homeScreen = HomeScreen()
        // definição da view principal
        view = homeScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // método chamado no viewDidLoad para que os delegate e dataSource sejam previamente configurados.
        // assim quando os métodos dos protocolos forem necessários já estejam prontos para uso.
        homeScreen?.settingsProtocolCollectionView(delegate: self, dataSource: self)
        
    }

}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // este método especifica quantos itens (células) devem ser exibidos em uma determinada seção da collectionView.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfItems
        
    }
    // Este método retorna uma célula configurada para exibição no indexPath especificado. Aqui você configura a célula com os dados apropriados antes de retorná-la.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // tratativa para verificar se o indexPath é diferente de zero
        if indexPath.row == 0 {
            // dequeueReusableCell faz a reutilização das células.
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath) as? StoryCardCollectionViewCell
            // esse é o momento que populamos a cell com os dados do array.
            // o método espera um array do tipo Stories
            // através da instância viewModel acessamos o lista de dados, que é do tipo Stories.
            cell?.setupCell(listStory: viewModel.getListStory)
            
            return cell ?? UICollectionViewCell() // caso cell seja nil será passado uma cell vazia.
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCardCollectionViewCell.identifier, for: indexPath) as? PostCardCollectionViewCell
            
            cell?.setupCell(listPost: viewModel.getListPosts)
            
            return cell ?? UICollectionViewCell()
            
        }
    }
    // Este método determina o tamanho de cada item na collectionView para o indexPath especificado.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
        
    }
    
}

