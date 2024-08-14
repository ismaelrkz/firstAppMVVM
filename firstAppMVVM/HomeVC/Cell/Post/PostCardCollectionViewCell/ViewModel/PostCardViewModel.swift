//
//  PostCardViewModel.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 13/08/24.
//

import UIKit

class PostCardViewModel {
    
    private var listPosts: [Posts]
    
    init(listPosts: [Posts]) {
        
        self.listPosts = listPosts
        
    }
    // método será chamado para definir a quantia de células baseado no index de listPosts.
    // seu local de chamada será na classe que assinar os protocolos da collection que contêm a célula com os elementos.
    public var numberOfItems: Int { listPosts.count }
    
    public func loadCurrentPost(indexPath: IndexPath) -> Posts {
        
        listPosts[indexPath.row]
        
    }
    
}
