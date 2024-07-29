//
//  TestePostCardCollectionViewCell.swift
//  firstAppMVVM
//
//  Created by Ismael Reckziegel on 24/07/24.
//

import UIKit

class TestPostCardCollectionViewCell: UICollectionViewCell {
    
    private var screen: TestPostCardCollectionViewScreen = TestPostCardCollectionViewScreen()
    
    private var viewModel: TestPostCardViewModel? //por qual motivo optional?
    
    static let identifier: String = "TestPostCardCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsScreen()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsScreen() {
        
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
        
    }
    
    public func setupCell(listPost: [Posts]) {
        
        viewModel = TestPostCardViewModel(listPost: listPost)
        
    }
    
    
}

// assinar protocolos da célula que irá dentro da collection da classe atual.
