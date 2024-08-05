//
//  TestePostCardViewModel.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 24/07/24.
//

import UIKit

class TestPostCardViewModel {

    private var listPost: [Posts]
    
    init(listPost: [Posts]) {
     
        self.listPost = listPost
        
    }
    
    public var numberOfItems: Int { listPost.count }
    
    func loadCurrentPost(indexPath: IndexPath) -> Posts {
        
        listPost[indexPath.row]
        
    }
    
}
